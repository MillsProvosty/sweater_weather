class GoogleService
  def initialize(location)
    @location = location
  end

  def geocode_location
    geo_response
  end

  private

    attr_reader :location

    def geocode_connection
      Faraday.new('https://maps.googleapis.com') do |f|
        f.params['address'] = location
        f.params['key'] = ENV['GOOGLE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def geo_response
      response = geocode_connection.get('maps/api/geocode/json?')
      JSON.parse(response.body, symbolize_names: true)
    end
end
