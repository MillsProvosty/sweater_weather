require 'rails_helper'

describe "Forecast Endpoint" do
  before(:each) do
    get '/api/v1/forecast?location=denver,co'
  end

  it "response is successful" do

    expect(response).to be_successful
    binding.pry
  end

  xit "sends forecast details" do
  end
end

#  Current weather type (e.g. partly cloudy)
#   Today: mostly cloudy until afternoon
#   Tonight: partly cloudy starting tonight, continuing until tomorrow morning
#   Current temp
#   High & low for today
#   Feels like
#   Humidity %
#   Visibility (miles)
#   UV index: 2 (low)
#   Forecasted temperature for each of the next 8 hours
#   For the next 5 days, "sunny" / "partly cloudy" / etc
#   For the next 5 days, 90% (chance of precipitation) -- & precipitation type?
#   For the next 5 days, the forecasted high temperature
