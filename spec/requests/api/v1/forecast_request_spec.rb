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

    binding.pry
    expect(forecast["currently"]["summary"]).to be_kind_of(String)
    expect(forecast["latitude"]).to be_kind_of(Float)
    expect(forecast["currently"]["time"]).to be_kind_of(Integer)
  end
end


# ex:
# "currently": {
#         "time": 1568507694,
#         "summary": "Clear",
#         "icon": "clear-day",
#         "nearestStormDistance": 76,
#         "nearestStormBearing": 136,
#         "precipIntensity": 0,
#         "precipProbability": 0,
#         "temperature": 71.89,
#         "apparentTemperature": 71.89,
#         "dewPoint": 52.64,
#         "humidity": 0.51,
#         "pressure": 1012.25,
#         "windSpeed": 8.41,
#         "windGust": 13.38,
#         "windBearing": 257,
#         "cloudCover": 0.09,
#         "uvIndex": 1,
#         "visibility": 6.642,
#         "ozone": 288.9
