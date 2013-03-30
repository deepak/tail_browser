require 'faye'
require './tail_app'

set :server, :thin

Faye::WebSocket.load_adapter('thin')

use Faye::RackAdapter, :mount      => '/faye',
                       :timeout    => 25
# :extensions => [MyExtension.new]

run Sinatra::Application

# rackup config.ru -o 0.0.0.0 -E production -p 4567
