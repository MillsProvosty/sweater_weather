require 'rails_helper'

describe "Backgrounds Endpoint" do
  before(:each) do
    get '/api/v1/backgrounds?location=denver,co'
  end

  it "returns the background for location" do
    expect(response).to be_successful

    background = JSON.parse(response.body)

    expect(background["background"].keys).to eq(["id", "location", "image"])
    expect(background).to be_kind_of(Hash)
    expect(background["background"].count).to eq(3)
    expect(background["background"]["id"]).to eq("1")
  end
end
