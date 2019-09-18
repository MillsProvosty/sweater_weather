class Api::V1::GifsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  
  def index
    render json: GifForecastFacade.new(params[:location]).return_all
  end
end
