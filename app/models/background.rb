class Background
  def initialize(url, location)
    @url = url
    @location = location
    @id = "1"
  end

  def background_response
    {background: {
      id: @id,
      location: location
      {
        url: url
        }
      }
    }
  end

  private
    attr_reader :url,
                :location
end
