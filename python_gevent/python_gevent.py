import gevent
from gevent import socket


def handle_socket(sock):
   sock.sendall("HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n")
   sock.close()

server = socket.socket()
server.bind(('localhost', 8060))
server.listen(500)
print "Running server on port 8060.\n"
while True:
   try:
      new_sock, address = server.accept()
   except KeyboardInterrupt:
      print "Exiting..."
      break
   # handle every new connection with a new coroutine
   gevent.spawn(handle_socket, new_sock)
