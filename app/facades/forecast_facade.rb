class ForecastFacade
  def initialize(location)
    @location = location
  end

  def return_forecast
    Forecast.new(geocode_results, forecast_service)
  end

  def geocode_results
    forecast_service
    #whats being returned?
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
