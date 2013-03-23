require 'sinatra/base'
require 'koda-content'
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

  get "/cars/:alias/?" do |car_alias|
    @car = model.cars.single(car_alias)
    erb :car
  end
end


run Rack::URLMap.new("/" => MyApp.new, "/api" => Koda::Api.new)