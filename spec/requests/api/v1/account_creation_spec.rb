require 'rails_helper'

describe 'Account Creation Endpoint' do
  before :each do
    @params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    @params2 = {
      "email": "new@example.com",
      "password": nil,
    }

    post '/api/v1/users', params: @params

    @user = User.last
  end

  it 'Returns api key upon account creation' do
    expect(response).to be_successful

    key = JSON.parse(response.body)

    expect(key["api_key"]).to be_kind_of(String)
  end

  it 'throws an error if params incorrect' do
    post '/api/v1/users', params: @params2

    expect(response).to have_http_status(400)

    error = JSON.parse(response.body)

    expect(error["error"]).to eq("There was an error, please try again.")
  end
end
