app = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nPong!\r\n"]]
end
run app