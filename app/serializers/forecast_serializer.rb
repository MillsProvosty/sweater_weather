class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :location,
             :current_weather,
             :daily_weather,
             :hourly_weather
end
