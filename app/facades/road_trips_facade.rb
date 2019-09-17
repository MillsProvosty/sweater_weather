class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_response
    TravelTime.new(google_response["routes"].first["legs"].first["distance"]["value"])
  end

  private

    def google_connection
      conn = Faraday.new(:url => 'https://maps.googleapis.com') do |f|
        f.params["origin"] = origin
        f.params["destination"] = destination
        f.params["key"] = ENV["GOOGLE_API_KEY"]
        f.adapter  Faraday.default_adapter
      end
    end

    def google_response
      GoogleService.new()
      JSON.parse(response.body)
    end


    attr_reader :origin,
                :destination
end
