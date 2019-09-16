require 'rails_helper'

describe 'Roadtrip Endpoint' do
  before :each do
    @user = create(:user)

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
  end
end
