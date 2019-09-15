class ForecastService
  def initialize(location)
    @location = location
  end

  def get_location
    darksky_response
  end

  def latitude
    @_latitude || geo_response[:results].first[:geometry][:location][:lat]
  end

  def longitude
    @_longitude || geo_response[:results].first[:geometry][:location][:lng]
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

    def geo_response
      response = geocode_location.get('maps/api/geocode/json?')
      JSON.parse(response.body, symbolize_names: true)
    end


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
