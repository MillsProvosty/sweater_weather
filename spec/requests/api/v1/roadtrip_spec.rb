require 'rails_helper'

describe 'Roadtrip Endpoint' do
  before :each do
    @user = create(:user)

    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'}

    @api_key = @user.api_key

    @params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": @api_key
    }

    post '/api/v1/road_trip', params: @params
  end

  it 'Returns successful response' do
    expect(response).to be_successful

    roadtrip = JSON.parse(response.body)
    binding.pry
  end
end

# Estimated Travel Time
# Hour of Arrival
# Weather at hour of arrival, includes tem, summary
