class RoadTrip
  def initialize(geocode, weather)
    @weather = weather
    @geocode = geocode
  end

  def roadtrip_response
    {
      hour_of_arrival: arrive,
      summary: weather[:currently][:summary],
      temperature: "#{temp} degrees",
      estimated_travel_time: geocode[:routes].first[:legs].first[:duration][:text]
    }
  end

  def temp
    @_temp || ((weather[:hourly][:data].first[:temperature].round * 9/5) + 32)
  end

  def arrive
    @_arrive || Time.at(geocode[:routes].first[:legs].first[:duration][:value]).strftime("%I:%M %p")
  end

  private
    attr_reader :weather,
                :geocode
end
