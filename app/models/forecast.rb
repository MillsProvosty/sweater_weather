class Forecast
  def initialize(location, forecast_info)
    binding.pry
    @id = nil
    @location = location
    @forecast_info = forecast_info
    @current_weather = current_weather
    @hourly_weather = hourly_weather
    @daily_weather = daily_weather
  end

  def current_weather
    {
     time: Time.at(forecast_info[:currently][:time]),
     summary: forecast_info[:currently][:summary],
     icon: forecast_info[:currently][:icon],
     temperature: forecast_info[:currently][:temperature],
     humidity: forecast_info[:currently][:humidity],
     wind_speed: forecast_info[:currently][:windSpeed],
     feels_like: forecast_info[:currently][:apparentTemperature],
     visibility: forecast_info[:currently][:visibility],
     UV_index: forecast_info[:currently][:uvIndex],
     high: forecast_info[:daily][:data].first[:temperatureHigh],
     low: forecast_info[:daily][:data].first[:temperatureLow]
    }
  end


  private
    attr_reader :location,
                :forecast_info

end
