class RoadTrip
  def initialize(geocode, weather)
    @weather = weather
    @geocode = geocode
    @id = "1"
  end

  def roadtrip_response
    {
      roadtrip: {
      id: @id,
      travel_info: {
        hour_of_arrival: arrive,
        estimated_travel_time: geocode[:routes].first[:legs].first[:duration][:text]
      },
      weather_info: {
        summary: weather[:currently][:summary],
        temperature: "#{temp} degrees"
      }
    }
  }
  end

  def temp
    @_temp || weather[:hourly][:data].first[:temperature].round
  end

  def arrive
    @_arrive || Time.at(geocode[:routes].first[:legs].first[:duration][:value]).strftime("%I:%M %p")
  end

  private
    attr_reader :weather,
                :geocode
end
