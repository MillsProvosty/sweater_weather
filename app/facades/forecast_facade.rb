class ForecastFacade
  def initialize(location)
    @location = location
  end

  def return_forecast
    Forecast.new(location, forecast_service)
    binding.pry
  end


  private
    attr_reader :location

    def geocode_service
      @_geocode_service ||= GoogleService.new(location).geocode_location
    end

    def forecast_service
      @_forecast_service ||= ForecastService.new(geocode_service).forecast_info
    end
end
