require 'rails_helper'

describe 'Account Creation Endpoint' do
  before :each do
    @params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    get '/api/v1/users', params: @params

    @user = User.last
  end

  it 'Returns api key upon account creation' do
    expect(response).to be_successful

    key = JSON.parse(response.body)

    expect(key["api_key"]).to eq(true)
  end
end
