require 'websocket-client-simple'
require 'sinatra'
require 'slim'
require 'json'

post '/event', provides: :json do
  requestBody = JSON.parse request.body.read
  ws = WebSocket::Client::Simple.connect 'http://10.20.52.198:8888'
  
  ws.on :message do |msg|
    puts msg.data
    ws.close
  end
  
  ws.on :open do
    message = {"event" => requestBody["type"]}.to_json
    ws.send message
  end
  
  ws.on :close do |e|
    return 'success'
  end
end

get '/feedback' do
  slim :feedback
end

