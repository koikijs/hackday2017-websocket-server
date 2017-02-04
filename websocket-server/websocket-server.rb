require 'em-websocket'
require 'logger'

connnections = []
logger = Logger.new(STDOUT)

EM::WebSocket.start({:host => "0.0.0.0", :port => 8888}) do |ws_conn|
  ws_conn.onopen do
    connnections << ws_conn
  end

  ws_conn.onmessage do |message|
    logger.info message
    connnections.each{|conn| conn.send(message) }
  end
end
