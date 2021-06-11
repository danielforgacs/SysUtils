import wsgiref.validate as validate
import wsgiref.simple_server as simple_server

HOST = 'http://localhost'
PORT = 8000
STATUS_OK = '200 OK'
HEADERS = [('Content-type', 'text/html')]


def route_request_urls(environ, start_response):
    response = [b"Hello World"]
    start_response(STATUS_OK, HEADERS)

    return response


def main():
    validator_app = validate.validator(route_request_urls)

    with simple_server.make_server('', PORT, validator_app) as httpd:
        print(f'{HOST}:{PORT}')
        httpd.serve_forever()


if __name__ == '__main__':
    main()
