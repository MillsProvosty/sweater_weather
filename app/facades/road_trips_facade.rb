class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_response
    binding.pry
    RoadTrip.new(geocode_response, get_weather).roadtrip_response
  end

  def geocode_response
    GoogleService.new.travel_time(@origin, @destination)
  end


  def get_weather
    ForecastService.new(geocode_response).future_weather_response
  end

  private

    attr_reader :origin,
                :destination
end
