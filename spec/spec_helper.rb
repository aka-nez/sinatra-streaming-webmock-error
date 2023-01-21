require 'rack/test'
require 'byebug'
require './app.rb'

RSpec.configure do |config|
  config.color = true
  config.include Rack::Test::Methods

  def app
    SimpleAPI
  end
end
