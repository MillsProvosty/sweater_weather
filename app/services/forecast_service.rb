class ForecastService
  def initialize(location)
    @location = location
  end

  def get_location
    geo_response
    darksky_response
  end

  private

    attr_reader :location

    def geocode_location
      Faraday.new('https://maps.googleapis.com') do |f|
        f.params['address'] = location
        f.params['key'] = ENV['GOOGLE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def geo_reponse
      reponse = geocode_location.get('maps/api/geocode/json?')
      JSON.parse(response.body, symbolize_names: true)
    end

    def latitude
      @_latitude || geocode_location[:results].first[:geometry][:location][:lat]
    end

    def longitude
      @_longitude || geocode_location[:results].first[:geometry][:location][:lng]
    end

    def darksky_connection
      Faraday.new('https://api.darksky.net') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def darksky_response
      darksky_connection.get("/forecast/#{ENV['DARKSKY_API_KEY']}/#{latitude},#{longitude}")
      JSON.parse(response.body, symbolize_names: true)
    end
end
