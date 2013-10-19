require 'sinatra/base'
require 'koda-api'
require 'koda-ui'

class MyApp < Sinatra::Base
  include Koda::UI::Helpers
  set :views, "views"
  get '/' do
    erb :home
  end

  get '/cars/?' do
    @cars = model.cars.all
    erb :cars
  end

  get "/cars/:url_name/?" do |url_name|
    @car = model.cars.single(url_name)
    erb :car
  end
end


run Rack::URLMap.new("/" => MyApp.new, "/api" => Koda::Api.new)