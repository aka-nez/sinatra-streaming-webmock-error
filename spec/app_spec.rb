require 'spec_helper'

RSpec.describe 'Simple API' do
  context '/stream' do
    it 'succesfully stream data' do
      get '/stream'
      expect(last_response.status).to eq(200)
    end
  end
end
