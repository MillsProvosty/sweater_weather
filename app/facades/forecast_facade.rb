class ForecastFacade
  def initialize(location)
    @location = location
  end

  def return_forecast
    ForecastService.new(location)
  end

  private
    attr_reader :location
end
