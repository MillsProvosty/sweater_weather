class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render status: :created, json: { api_key: user.api_key }
    else
      error
    end
  end

  private
  def error
    render status: :unauthorized, json: { error: "Incorrect username or password." }
  end
end
