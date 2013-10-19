require 'koda-api'
require 'koda-omniauth'

class MyAuthStrategy < Koda::Auth::OmniAuthIntegration
  use ::OmniAuth::Strategies::Developer
  puts __dir__
  set :views, File.join(File.dirname(__FILE__), 'views')
end

class MyApi < Koda::Api
  use MyAuthStrategy
end

run MyApi