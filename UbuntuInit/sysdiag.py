"""
Module to run system checks.
"""

import sys
import io
import subprocess
import types
import functools
import wsgiref.simple_server as simpserv


DO_PRINT = True
DIAGNOSTIC_FUNC_PREFIX = 'check_'


EXPECTEDSWAPPINESS = 30
GRUBFILE = '/etc/default/grub'
SPLASHSCREENMARKER = 'quiet splash'




class StdOutCapture:
    def __enter__(self, *args):
        self.stdout = io.StringIO()
        sys.stdout = self.stdout
        return self

    def __exit__(self, *args):
        sys.stdout = sys.__stdout__

    @property
    def data(self):
        return self.stdout.getvalue()





def print_func_result(func):
    @functools.wraps(func)
    def wrapper():
        result = func()
        if DO_PRINT:
            print(result)
        return result
    return wrapper




@print_func_result
def check_swappiness():
    cmd = ['cat', '/proc/sys/vm/swappiness']
    swappinesscheck = subprocess.run(cmd, capture_output=True)
    swappinessnum = int(swappinesscheck.stdout.decode().strip())
    msg = '[INFO] swappiness OK.'

    if swappinessnum != EXPECTEDSWAPPINESS:
        msg = '[ERROR] swappiness is: '+str(swappinessnum)+'; expected: '+str(EXPECTEDSWAPPINESS)

    return msg




@print_func_result
def check_boot_splash_screen():
    with open(GRUBFILE, 'r') as filestream:
        grubconfig = filestream.read()

    msg = '[INFO] boot splash screen is OFF.'

    if SPLASHSCREENMARKER in grubconfig:
        msg = '[ERROR] boot splash screen is turned ON in grub config'

    return msg





def collect_diag_funcs(globalsdict):
    """
    If this is not called late anough in the module
    it won't collect all the funcs!
    """
    is_func = lambda item: isinstance(item[1], types.FunctionType)
    is_diag = lambda item: item[0].startswith(DIAGNOSTIC_FUNC_PREFIX)
    diagfuncs = globalsdict.items()
    diagfuncs = filter(is_func, diagfuncs)
    diagfuncs = filter(is_diag, diagfuncs)

    for item in diagfuncs:
        func = item[1]

        yield func




def main():
    for func in collect_diag_funcs(globalsdict=globals()):
        func()




def responde_html_report(environ, start_response):
    html = ''
    with StdOutCapture() as stdout:
        main()
        html = stdout.data

    # html += check_swappiness()
    response = [html.encode()]

    start_response('200 OK', [('Content-type', 'text/plain; charset=utf-8')])

    return response




def serve_diag():
    with simpserv.make_server(host='', port=8000, app=responde_html_report) as httpd:
        print('http://localhost:8000')
        httpd.serve_forever()


if __name__ == '__main__':
    # main()
    serve_diag()
