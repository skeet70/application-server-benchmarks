import threading
import SocketServer


class ThreadedTCPRequestHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        self.request.send(
            'HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n'
        )
        self.request.close()


class Pong(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
    pass

if __name__ == "__main__":
    server = Pong(('localhost', 8050), ThreadedTCPRequestHandler)
    ip, port = server.server_address

    # Start a thread with the server -- that thread will then start one
    # more thread for each request
    server_thread = threading.Thread(target=server.serve_forever)
    # Exit the server thread when the main thread terminates
    server_thread.setDaemon(True)
    server_thread.start()
    print "Running server on port 8050.\n"

    while True:
        try:
            server.serve_forever()
        except KeyboardInterrupt:
            print "Exiting..."
            break
