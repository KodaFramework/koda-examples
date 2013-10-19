# Before executing this ensure that the api is available by:
# cd 001-api-only
# rackup

require 'httmultiparty'
require 'json'

class Api
  include HTTMultiParty
  base_uri 'localhost:9292'
end

class Document < Api
  format :json

  def self.create(path, data)
    put(path, :body => data.to_json)
  end
end

class Media < Api
  def self.create(path, data_path)
    put(path, query: {media: File.new(data_path)})
  end
end

Document.create('/cars/ferrari.json', {founded: 1929, founder: 'Enzo Ferrari', country: 'Italy'})
Document.create('/cars/ferrari/f12-berlinetta.json', {engine: 'V12', cc: 6262, hp: 730})
Media.create('/cars/ferrari/f12-berlinetta.jpeg', 'data/ferrari-berlinetta.jpg')

Document.create('/cars/porsche.json', {founded: 1931, founder: 'Ferdinand Porsche', country: 'Germany'})
Document.create('/cars/porsche/911.json', {engine: 'Flat 6', cc: 3400, hp: 350})
Media.create('/cars/porsche/911.jpeg', 'data/porsche-911.jpg')
