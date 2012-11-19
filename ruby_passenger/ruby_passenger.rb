# require 'rubygems'
# require 'rack'
require 'rack-handler-apache'

# def application(env)
#   [200, {"Content-Type" => "text/html"}, ["HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n"]]
# end

# Rack::Handler::Apache.run method(:application), :Port => 9292

class MyApp
  def call(environment) # this method has to be named call
    [200, # the status code
     {"Content-Type" => "text/plain", "Content-length" => "11" }, # headers
     ["Hello world"]] # the body
  end
end

# presuming you have rack & webrick
if $0 == __FILE__
  require 'rack'
  Rack::Handler::Apache.run MyApp.new, :Port => 9292
end