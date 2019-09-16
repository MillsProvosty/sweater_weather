class ForecastFacade
  def initialize(location)
    @location = location
  end

  def return_forecast
    Forecast.new(geocode_service, forecast_service)
    # ForecastService.new(location).get_location
  end

  private
    attr_reader :location

    def geocode_service
      @_geocode_service ||= GoogleService.geocode_location(location)
    end

    def forcast_service
      @_forcast_service ||= ForecastService.new(geocoded_location).forecast_info
    end
end
