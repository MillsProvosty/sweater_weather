class GifForecastFacade
  #This is a facade! WeatherGif/GiphyForecast/GifForecast
  def initialize(location)
    @location = location
  end

  def return_all
    GiphySearch.new(create_summaries, create_urls).renders_hash
  end

  def forecast_summary
    ForecastFacade.new(location).return_forecast
  end

  def create_summaries
    forecast_summary[:daily][:data][0..4].map do |f|
      Summary.new(f[:summary], f[:time])
    end
  end

  def create_urls
    create_summaries.map do |s|
      GifsFacade.new(s.summary).return_gifs
    end
  end

  private
    attr_reader :location
end
