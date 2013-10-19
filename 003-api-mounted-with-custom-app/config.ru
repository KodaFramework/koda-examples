require 'sinatra/base'
require 'koda-api'

class MyApp < Sinatra::Base
  get '/' do
    'This is a regular sinatra app, do what you will with it.<p>You can find Koda api <a href="/api">here</a>'
  end
end


run Rack::URLMap.new("/" => MyApp.new, "/api" => Koda::Api.new)