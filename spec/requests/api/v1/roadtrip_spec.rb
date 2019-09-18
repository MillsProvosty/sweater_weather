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

    expect(roadtrip).to be_kind_of(Hash)
    expect(roadtrip.count).to eq(1)
    expect(roadtrip["roadtrip"]["weather_info"]["summary"]).to be_kind_of(String)
    expect(roadtrip["roadtrip"]["id"]).to eq("1")
    expect(roadtrip["roadtrip"].keys).to eq(["id", "travel_info", "weather_info"])
  end
end
