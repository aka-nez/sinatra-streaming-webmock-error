require 'rack/test'
require 'webmock/rspec'
require 'byebug'
require './app.rb'

# Let's imagine, that here is allowed to make request to your local S3 storage
# like minio or fake-gcs-server
WebMock.disable_net_connect!(allow: 'https://postman-echo.com')

RSpec.configure do |config|
  config.color = true
  config.include Rack::Test::Methods

  def app
    SimpleAPI
  end
end
