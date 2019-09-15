class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def return_background
    BackgroundService.new(location).retrieve_background
  end

  private
    attr_reader :location
end
