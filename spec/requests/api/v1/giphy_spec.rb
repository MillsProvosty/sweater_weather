require 'rails_helper'

describe "Giphy Endpoint" do
  before(:each) do
    get '/api/v1/gifs?location=denver,co'
  end

  it "has successful response, with images, time, summary and url" do
    expect(response).to be_successful

    giphy = JSON.parse(response.body)
binding.pry
    expect(giphy["data"]["images"].count).to eq(5)
    
  end

end
