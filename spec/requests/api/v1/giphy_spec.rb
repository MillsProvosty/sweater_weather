require 'rails_helper'

describe "Giphy Endpoint" do
  before(:each) do
    get '/api/v1/gifs?location=denver,co'
  end

  it "has successful response, with images, time, summary and url" do
    expect(response).to be_successful

    giphy = JSON.parse(response.body)

    expect(giphy["data"]["images"].count).to eq(5)
    expect(giphy["data"]["images"].first["time"]).to be_kind_of(String)
    expect(giphy["data"]["images"].first["url"]).to be_kind_of(String)
    expect(giphy["copyright"]).to eq("2019")
  end
end
