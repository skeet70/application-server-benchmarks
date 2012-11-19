require 'eventmachine'

module Pong
  def post_init
    send_data "HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n"
    close_connection
  end
end

# Note that this will block current thread.
EventMachine::run do
  EventMachine::start_server "localhost", 8010, Pong
  puts "Running server on port 8010"
end