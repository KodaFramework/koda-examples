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
    @marque = model.cars.single(url_name)
    @models = model.cars(url_name).all
    erb :marque
  end

  get "/cars/:type/:car_model/?" do |type, car_model|
    @base_url = "/cars/#{type}/#{car_model}"
    @car = model.cars(type).single(car_model)
    erb :car
  end
end


run Rack::URLMap.new("/" => MyApp.new, "/api" => Koda::Api.new)