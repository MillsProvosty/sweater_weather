require 'rails_helper'

describe 'Roadtrip Endpoint' do
  before :each do
    @body = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    post '/api/v1/road_trip', body: @body
  end

  it 'Returns successful response' do
    expect(response).to be_successful

    roadtrip = JSON.parse(response.body)
  end
end
