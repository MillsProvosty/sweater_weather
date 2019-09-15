require 'rails_helper'

describe "Forecast Endpoint" do
  before(:each) do
    get '/api/v1/forecast?location=denver,co'
  end

  # it "response is includes latitude and longitude" do
  #   expect(response).to be_successful
  #
  #   city = JSON.parse(response.body)
  #
  #   expect(city["results"].first["geometry"]["bounds"]["northeast"].first[0]).to eq("lat")
  #   expect(city["results"].first["geometry"]["bounds"]["northeast"].first[0]).to eq("lat")
  # end

  it "sends forecast details" do
    expect(response).to be_successful

    forecast = JSON.parse(response.body)

    expect(forecast["currently"]["summary"]).to be_kind_of(String)
    expect(forecast["latitude"]).to be_kind_of(Float)
    expect(forecast["longitude"]).to be_kind_of(Float)
    expect(forecast["currently"]["time"]).to be_kind_of(Integer)
    expect(forecast["currently"]["summary"]).to be_kind_of(String)
    expect(forecast["currently"]["humidity"]).to be_kind_of(Float)
    expect(forecast["currently"]["uvIndex"]).to be_kind_of(Integer)
  end
end
