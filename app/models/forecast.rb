class Forecast
  attr_reader :id,
              :location,
              :forecast_info
              
  def initialize(location, forecast_info)
    @id = 1
    @location = location
    @forecast_info = forecast_info
    @current_weather = current_weather
    @daily_weather = daily_weather
    @hourly_weather = hourly_weather
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

  def daily_weather
    forecast_info[:daily][:data][0..7].map do |day|
      { day: Time.at(day[:time]),
        summary: day[:summary],
        icon: day[:icon],
        precipitation: day[:precipProbability],
        high: day[:temperatureHigh],
        low: day[:temperatureLow]
      }
    end
  end

  def hourly_weather
    forecast_info[:hourly][:data][0..11].map do |hour|
      { time: Time.at(hour[:time]),
        summary: hour[:summary],
        temperature: hour[:temperature],
        icon: hour[:icon]
      }
    end
  end
end
