class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_response
    time = GoogleService.new.travel_time(@origin, @destination)
    time[:routes].first[:legs].first[:distance][:value]
  end

  private

    attr_reader :origin,
                :destination
end
