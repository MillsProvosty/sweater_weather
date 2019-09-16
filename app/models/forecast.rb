class Forecast
  def initialize(json, location)
    @json = json
    @location = location
  end


  private
    attr_reader :location

end
