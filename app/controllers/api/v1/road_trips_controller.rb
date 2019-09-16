class Api::V1::RoadTripsController < ApplicationController
  def create
      binding.pry
      api_key = params["api_key"]
      destination = params["destination"]
      origin = params["origin"]
    user = User.find_by(params["api_key"])
    if user
      render json: RoadTripsFacade.new(destination, origin).response
    else
      trip_error
    end

  end

  private
    def trip_error
      
    end
end
