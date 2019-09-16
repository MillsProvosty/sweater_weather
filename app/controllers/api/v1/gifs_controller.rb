class Api::V1::GifsController < ApplicationController
  def index
    forecast_summary = ForecastFacade.new(params[:location]).return_forecast
    # summary = forecast_summary[:daily][:data].first[:summary]
    render json: GifsFacade.new(forecast_summary).return_gifs
  end
end
