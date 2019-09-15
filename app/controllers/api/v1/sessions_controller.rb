class Api::V1::SessionsController < ApplicationController
  def create
    binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render status: :created, json: { api_key: user.api_key }
    else

    end
  end
end
