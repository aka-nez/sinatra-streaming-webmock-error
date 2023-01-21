require 'sinatra'
require 'http'

class SimpleAPI < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  get '/stream' do
    # Let's imagine that this is a large file from S3 storage,
    # and we should stream this file through our API to the client.
    # Client, for some reason, can't get the signed URL for this file and download it directly.
    # We also can't read the file into memory because it high-load operation
    # So, we want to read chunks and stream each chunk as soon as possible
    response = HTTP.get('https://postman-echo.com/stream/500')

    stream do |out|
      response.body.each do |chunk|
        out << 'chunk received'
        out << '<br>'
        out << chunk
        out << '<br>'
      end
    end
  end
end 