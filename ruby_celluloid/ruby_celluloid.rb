require 'celluloid/io'

class Pong
   include Celluloid::IO

   def initialize()
      @server = TCPServer.new('localhost', 8020)
      puts "Running server on port 8020.\n"
      run!
   end

   def finalize
      @server.close if @server
   end

   def run
      loop { handle_connection! @server.accept }
   end

   def handle_connection(socket)
      socket.write "HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n"
      socket.close
   end
end

supervisor = Pong.supervise()
trap("INT") { supervisor.terminate; exit }
sleep
