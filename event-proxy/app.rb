require 'websocket-client-simple'
require 'sinatra'
require 'slim'
require 'json'

post '/event', provides: :json do
  requestBody = JSON.parse request.body.read
  ws = WebSocket::Client::Simple.connect 'http://192.168.1.117:8888'
  
  ws.on :message do |msg|
    puts msg.data
    ws.close
  end
  
  ws.on :open do
    result = []
    result << requestBody["type"]
    result << requestBody["value"] unless requestBody["value"].nil?
    message = result.join(',')
    ws.send message
  end
  
  ws.on :close do |e|
  end
  return ''
end

get '/feedback' do
  slim :feedback
end

