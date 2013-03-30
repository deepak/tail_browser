Tail a file using PubSub (provided by Faye rubygem)

config.ru runs a Sinatra webapp and the Faye pubsub server

The Sinatra app is used to serve the initial UI (html and javascript)
Further communication happens with the Faye server

tail_browser.rb is a EventMachine server which tails the file 
and publishes the data to the Faye channel

## Usage

Run these two commands

rackup config.ru -o 0.0.0.0 -E production -p 4567

ruby tail_browser.rb
