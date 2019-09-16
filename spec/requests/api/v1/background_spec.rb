require 'rails_helper'

describe "Backgrounds Endpoint" do
  before(:each) do
    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'}

    get '/api/v1/backgrounds?location=denver,co', headers: @headers
  end

  it "returns the background for location" do
    expect(response).to be_successful

    background = response.body
    expect(background).to be_kind_of(String)
  end
end
