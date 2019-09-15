class Api::V1::ForecastsController < ApplicationController

  def show
    render json: ForecastFacade.new(params[:location]).geocode_location
  end
end
