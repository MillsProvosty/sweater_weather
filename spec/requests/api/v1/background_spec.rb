require 'rails_helper'

describe "Backgrounds Endpoint" do
  before(:each) do
    get '/api/v1/backgrounds?location=denver,co'
  end

  it "returns the background for location" do
    expect(response).to be_successful

    background = JSON.parse(response.body)
  end
end
