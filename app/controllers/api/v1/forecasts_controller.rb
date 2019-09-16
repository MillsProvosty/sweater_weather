class Api::V1::ForecastsController < ApplicationController
  def show
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]).return_forecast)
  end
end
