import datetime
import time
import wsgiref.validate as validate
import wsgiref.simple_server as simple_server

HOST = 'http://localhost'
PORT = 8000
STATUS_OK = '200 OK'
HEADERS = [('Content-type', 'text/html')]

ROOT_HMTL = """
<div id='root_diag_a'></div>
<div id='root_diag_b'></div>
<script>
    fetch('/diag_a')
        .then(response => response.text())
        .then(html => console.log(html))
    fetch('/diag_b')
        .then(response => response.text())
        .then(html => console.log(html))
</script>
"""


def diag_a():
    time.sleep(5)
    return 'diag_a'
def diag_b():
    time.sleep(1)
    return 'diag_b'




def route_request_urls(environ, start_response):
    time = str(datetime.datetime.now())
    url = environ['PATH_INFO']
    print(time, url)

    if url == '/':
        html = time+ROOT_HMTL
        response = [html.encode()]
    else:
        # func = globals()[url[1:]]
        func = globals().get(url[1:], lambda: '-')
        html = func()
        response = [html.encode()]

    start_response(STATUS_OK, HEADERS)

    return response


def main():
    validator_app = validate.validator(route_request_urls)

    with simple_server.make_server('', PORT, validator_app) as httpd:
        print(f'{HOST}:{PORT}')
        httpd.serve_forever()


if __name__ == '__main__':
    main()
