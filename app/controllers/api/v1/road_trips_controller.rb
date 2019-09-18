class Api::V1::RoadTripsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  
  def create
      api_key = params["api_key"]
      origin = params["origin"]
      destination = params["destination"]
      user = User.find_by(api_key: api_key)
    if user
      render json: RoadTripsFacade.new(origin, destination).road_trip_response
    else
      trip_error
    end
  end

  private
    def trip_error
      render status: :unauthorized, json: { error: "Unauthorized user, please try again." }
    end
end
