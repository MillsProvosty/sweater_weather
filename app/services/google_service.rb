class GoogleService
  
  def geocode_location(location)
    geo_response('maps/api/geocode/json?', { address: location} )
  end

  def travel_time(origin, destination)
    geo_response('maps/api/directions/json?', { origin: origin, destination: destination} )
  end


  private

    attr_reader :location

    def geocode_connection
      Faraday.new('https://maps.googleapis.com') do |f|
        f.params['key'] = ENV['GOOGLE_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def geo_response(url, params)
      response = geocode_connection.get(url, params)
      JSON.parse(response.body, symbolize_names: true)
    end
end
