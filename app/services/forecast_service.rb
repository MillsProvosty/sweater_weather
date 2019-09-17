class ForecastService
  def initialize(geocode_response)
    @geocode_response = geocode_response
  end

  def lat
    @_lat || geocode_response[:results].first[:geometry][:location][:lat]
  end

  def long
    @_long || geocode_response[:results].first[:geometry][:location][:lng]
  end

  def destination_lat
    @_destination_lat || geocode_response[:routes].first[:legs].first[:end_location][:lat]
  end

  def destination_long
    @_destination_long || geocode_response[:routes].first[:legs].first[:end_location][:lng]
  end

  def time
    @_time || geocode_response[:routes].first[:legs].first[:distance][:value]
  end

  def forecast_info
    response = darksky_connection.get("#{lat},#{long}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def future_weather_response
    response = darksky_connection.get("#{destination_lat},#{destination_long},#{time}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :geocode_response

    def darksky_connection
      Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/") do |f|
        f.adapter Faraday.default_adapter
      end
    end
end
