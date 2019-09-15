class ForecastFacade
  def initialize(location)
    @location = location
  end

  def geocode_location
    conn = Faraday.new('https://maps.googleapis.com') do |f|
      f.params['address'] = @location
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.adapter Faraday.default_adapter
    end

    response = conn.get('maps/api/geocode/json?')
    JSON.parse(response.body, symbolize_names: true)
  end

  def latitude
    @_latitude || geocode_location[:results].first[:geometry][:location][:lat]
  end

  def longitude
    @_longitude || geocode_location[:results].first[:geometry][:location][:lng]
  end

  def return_forecast
    geocode_location

    conn = Faraday.new('https://api.darksky.net') do |f|
      f.adapter Faraday.default_adapter
    end

    response = conn.get("/forecast/#{ENV['DARKSKY_API_KEY']}/#{latitude},#{longitude}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :location
end
