from wsgiref.validate import validator
from wsgiref.simple_server import make_server

STATUS_OK = '200 OK'
HEADERS = [('Content-type', 'text/plain')]


def route_request_urls(environ, start_response):
    response = [b"Hello World"]
    start_response(STATUS_OK, HEADERS)

    return response


if __name__ == '__main__':
    validator_app = validator(route_request_urls)

    with make_server('', 8000, validator_app) as httpd:
        print("http://localhost:8000")
        httpd.serve_forever()
