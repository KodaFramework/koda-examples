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
    @cars = koda.query('/cars')
    erb :cars
  end

  get "/cars/:url_name/?" do |url_name|
    @marque = koda.single("/cars/#{url_name}")
    @models = koda.query("/cars/#{url_name}")
    erb :marque
  end

  get "/cars/:type/:car_model/?" do |type, car_model|
    @base_url = "/cars/#{type}/#{car_model}"
    @car = koda.single("/cars/#{type}/#{car_model}")
    erb :car
  end
end


run Rack::URLMap.new("/" => MyApp.new, "/api" => Koda::Api.new)