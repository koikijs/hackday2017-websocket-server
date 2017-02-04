require 'rubygems'
require 'websocket-client-simple'

ws = WebSocket::Client::Simple.connect 'http://104.198.84.60:8888'

ws.on :message do |msg|
  puts msg.data
end

ws.on :open do
  ws.send 'hello!!!'
end

ws.on :close do |e|
  p e
  exit 1
end

#loop do
  #ws.send STDIN.gets.strip
#end
sleep 1
