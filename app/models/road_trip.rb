class RoadTrip
  def initialize(geocode, weather)
    @weather = weather
    @geocode = geocode
  end

  def roadtrip_response
    {
      summary: weather[:currently][:summary],
      temperature: "#{temp} degrees",
      estimated_travel_time: geocode[:routes].first[:legs].first[:duration][:text]
    }
  end

  def temp
    @_temp || ((weather[:hourly][:data].first[:temperature].round * 9/5) + 32)
  end

  private
    attr_reader :weather,
                :geocode
end
