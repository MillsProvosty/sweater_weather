class ForecastFacade
  def initialize(location)
    @location = location
  end

  private
    attr_reader :location
end
