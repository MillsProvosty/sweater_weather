class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def response
    conn = Faraday.new(:url => 'https://maps.googleapis.com') do |f|
      f.params["origin"] = origin
      f.params["destination"] = destination
      f.params["key"] = ENV["GOOGLE_API_KEY"]
      f.adapter  Faraday.default_adapter
    end

    response = conn.get '/maps/api/directions/json?'
    response.body
    
  end

  private
    attr_reader :origin,
                :destination

end
