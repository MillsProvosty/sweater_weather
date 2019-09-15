require 'rails_helper'

describe "Forecast Endpoint" do
  before(:each) do
    get '/api/v1/forecast?location=denver,co'
  end

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
