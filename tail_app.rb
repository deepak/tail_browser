require 'sinatra'

helpers do
  def faye_path
    "#{request.scheme}://#{request.host}:#{request.port}/faye"
  end

  def faye_js_path
    faye_path + "/faye.js"
  end
end

get '/tail' do
  haml :tail
end
