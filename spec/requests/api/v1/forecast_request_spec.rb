require 'rails_helper'

describe "Forecast Endpoint" do
  before(:each) do
    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'}

    get '/api/v1/forecast?location=denver,co', headers: @headers
  end

  it "sends forecast details" do
    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    expect(forecast["data"]["id"]).to eq("1")
    expect(forecast["data"]["attributes"]["location"]).to eq("denver,co")
    expect(forecast["data"]["attributes"]["current_weather"]["summary"]).to be_kind_of(String)
    expect(forecast["data"]["attributes"]["current_weather"]["temperature"]).to be_kind_of(Float)
    expect(forecast["data"]["attributes"]["current_weather"]["UV_index"]).to be_kind_of(Integer)
    expect(forecast["data"]["attributes"]["current_weather"]["high"]).to be_kind_of(Float)
  end
end
