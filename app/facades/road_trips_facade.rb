class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip_response
    this = google_response
    this["routes"].first["legs"].first["distance"]["value"]
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
      response = google_connection.get('maps/api/directions/json?')
      JSON.parse(response.body, symbolize_names: true)
    end
    
    attr_reader :origin,
                :destination
end
