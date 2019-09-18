class Api::V1::GifsController < ApplicationController
  def index
    render json: GatherService.new(params[:location]).return_all
  end
end
