import subprocess
import wsgiref.simple_server as simpserv



DO_PRINT = True
EXPECTEDSWAPPINESS = 30
GRUBFILE = '/etc/default/grub'
SPLASHSCREENMARKER = 'quiet splash'




def print_func_result(func):
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




def make_html_report(environ, start_response):
    html = ''
    html += check_swappiness()
    response = [html.encode()]

    start_response('200 OK', [('Content-type', 'text/plain; charset=utf-8')])

    return response




def serve_diag():
    with simpserv.make_server(host='', port=8000, app=make_html_report) as httpd:
        print('http://localhost:8000')
        httpd.serve_forever()




def main():
    check_swappiness()
    check_boot_splash_screen()



if __name__ == '__main__':
    main()
    # serve_diag()
