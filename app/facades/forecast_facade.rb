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

  def return_forecast
    binding.pry
  end

  private
    attr_reader :location
end
