class Api::V1::ForecastsController < ApplicationController

  def show
    render locals { 
      facade: ForecastFacade.new(params[:location])
    }
  end
end
