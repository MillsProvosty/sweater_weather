require 'rails_helper'

describe "Login Endpoint" do
  before(:each) do
    @user = create(:user, email: "whatever@example.com", password: "password")
    @params = {
      "email": @user.email,
      "password": @user.password
    }

    get '/api/v1/sessions', params: @params
  end

  it 'returns api key for logged in user' do
    expect(response).to be_successful

    binding.pry
    api = reponse.body
  end
end
