class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render status: :created, json: {api_key: user.api_key}
    else
      render status: :bad_request, json: { error: user.errors.full_messages.join('. ') }
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
