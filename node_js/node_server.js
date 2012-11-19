var net = require('net');

var server = net.createServer(function (socket) {
   socket.write('HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n');
   socket.destroy();
});
console.log("Running server on port 8030.\n");
server.listen(8030, 'localhost');