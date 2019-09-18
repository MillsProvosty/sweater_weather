class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { api_key: user.api_key }, status: :created
    else
      authentication_error
    end
  end

  private
  def authentication_error
    render status: :unauthorized, json: { error: "Incorrect username or password." }
  end
end
