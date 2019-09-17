class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_response
    geocode_response
    get_weather
  end

  def geocode_response
    GoogleService.new.travel_time(@origin, @destination)
  end


  def get_weather
    this = ForecastService.new(geocode_response).future_weather_response
    binding.pry
  end

  private

    attr_reader :origin,
                :destination
end
