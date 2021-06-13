import datetime
import wsgiref.validate as validate
import wsgiref.simple_server as simple_server

HOST = 'http://localhost'
PORT = 8000
STATUS_OK = '200 OK'
HEADERS = [('Content-type', 'text/html')]

ROOT_HMTL = """
<script>
    setInterval(function() {
      fetch('/')
    }, 3000);
</script>
"""

# await new Promise(func => setTimeout(func, 2000));
# var intervalId = setInterval(function() {
#   alert("Interval reached every 5s")
# }, 5000);
# setInterval(function() {
#   console.log('lkjhk')
# }, 3000);



def route_request_urls(environ, start_response):
    time = str(datetime.datetime.now())
    print(time)
    url = environ['PATH_INFO']
    print(url)
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
