class ForecastService
  def initialize(geo_response)
    @geo_response = geo_response
  end

  def forecast_info
    darksky_response
  end

  def latitude
    @_latitude || geo_response[:results].first[:geometry][:location][:lat]
  end

  def longitude
    @_longitude || geo_response[:results].first[:geometry][:location][:lng]
  end

  private
    attr_reader :geo_response

    def darksky_connection
      Faraday.new('https://api.darksky.net') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def darksky_response
      response = darksky_connection.get("/forecast/#{ENV['DARKSKY_API_KEY']}/#{latitude},#{longitude}")
      JSON.parse(response.body, symbolize_names: true)
    end
end
