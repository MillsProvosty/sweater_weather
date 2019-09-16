class RoadTripsFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def response
    binding.pry
  end

  private
    attr_reader :origin,
                :destination

end
