import datetime
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
    // setInterval(function() {
    //   fetch('/diag')
    // }, 3000);
</script>
"""


def diag_a():
    return 'diag_a'
def diag_b():
    return 'diag_b'




def route_request_urls(environ, start_response):
    time = str(datetime.datetime.now())
    url = environ['PATH_INFO']
    print(time, url)

    if url == '/':
        html = time+ROOT_HMTL
        response = [html.encode()]
    else:
        html = time+ROOT_HMTL
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
