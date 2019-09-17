class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def return_background
    Background.new(BackgroundService.new(location).retrieve_background, location).background_response
  end

  private
    attr_reader :location
end
