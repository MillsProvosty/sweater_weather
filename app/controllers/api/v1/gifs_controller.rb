class Api::V1::GifsController < ApplicationController
  def index
    render json: GifsFacade.new(params[:location]).return_gifs
  end
end
