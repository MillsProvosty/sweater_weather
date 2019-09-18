class Api::V1::GifsController < ApplicationController
  def index
    render json: GifForecastFacade.new(params[:location]).return_all
  end
end
