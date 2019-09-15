class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackroundsFacade.new(params[:location]).return_background
  end
end
