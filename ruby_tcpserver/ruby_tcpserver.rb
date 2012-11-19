require 'socket'

server = TCPServer.new 8000
print "Running on port 8000\n"

loop do
   Thread.start(server.accept) do |client|
      client.puts "HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n"
      client.close
   end
end