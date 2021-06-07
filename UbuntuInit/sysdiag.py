import subprocess
import wsgiref.simple_server as simpserv

EXPECTEDSWAPPINESS = 30




def print_result(func):
    def wrapper():
        result = func()
        print(result)
        return result
    return wrapper




@print_result
def check_swappiness():
    cmd = ['cat', '/proc/sys/vm/swappiness']
    swappinesscheck = subprocess.run(cmd, capture_output=True)
    swappinessnum = int(swappinesscheck.stdout.decode().strip())
    msg = '[ERROR] swappiness OK.'

    if swappinessnum != EXPECTEDSWAPPINESS:
        msg = '[ERROR] swappiness is: '+str(swappinessnum)+'; expected: '+str(EXPECTEDSWAPPINESS)

    return msg




def make_html_report(environ, start_response):
    print('alksdfhj')
    html = ''
    html += check_swappiness()

    start_response('200 OK', [('Content-type', 'text/plain; charset=utf-8')])

    response = [html.encode()]

    return response




def serve_diag():
    with simpserv.make_server(host='', port=8000, app=make_html_report) as httpd:
        print('http://localhost:8000')
        httpd.serve_forever()




def main():
    check_swappiness()




if __name__ == '__main__':
    main()
    serve_diag()
