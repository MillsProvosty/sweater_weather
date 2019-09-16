require 'rails_helper'

describe "Login Endpoint" do
  before(:each) do
    @user = create(:user, email: "whatever@example.com", password: "password")
    @user2 = create(:user, email: "fakeemail@example.com", password: "password")

    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'}

    @params = {
      "email": @user.email,
      "password": @user.password
    }

    @params2 = {
      "email": @user2.email,
      "password": "wongpassword"
    }

    get '/api/v1/sessions', params: @params, headers: @headers
  end

  it 'returns api key for logged in user' do
    expect(response).to be_successful

    api = JSON.parse(response.body)

    expect(api["api_key"]).to eq(true)
  end

  it 'returns error with incorrect password' do
    get '/api/v1/sessions', params: @params2, headers: @headers

    expect(response).to have_http_status(401)

    error = JSON.parse(response.body)

    expect(error["error"]).to eq("Incorrect username or password.")
  end
end
