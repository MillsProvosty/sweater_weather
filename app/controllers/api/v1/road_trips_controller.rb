class Api::V1::RoadTripsController < ApplicationController
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

  # I want code that will return the travel time from two places - Make an object of this
  # then I need code that will take the travel time and enter it into the darksky connection
  # Then format the response to have temperature, Summary and that original estimated travel time.
  # Time.at(time).utc.strftime("%-H hours and %-M minutes")
  #Step 1: Facade => calls google API Service, gets hash with info, create/return distance PORO
  #step 2: Facade => calls Darksky API Service, gets Weather, Creates Roadtrip object that passes/returns
  #distance and All the info, FORMAT the JSON Response in here.
  #Step 3: Facade calls Serializer= sets attributes

  end

  private
    def trip_error
      render status: :unauthorized, json: { error: "Unauthorized user, please try again." }
    end
end
