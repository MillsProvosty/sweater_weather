class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render status: :created, json: { api_key: user.api_key }
    else
      render status: :bad_request, json: { error: user.errors.full_messages.join('. ') }
    end
  end
end
