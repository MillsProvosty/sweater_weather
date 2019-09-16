class Api::V1::GifsController < ApplicationController
  def index
    #I need code that will get the 5 day forecast passing in params[:location] CHECK

    #take that 5 day array of forecasts, and create an array of summaries- probably a service

    #pass that array of summaries into a giphy service that will search and return 5 gifs
    #a serializer?? or facade?? that will pass in both the summaries and gifs, rendering it in the format expected.


    forecast_summary = ForecastFacade.new(params[:location]).return_forecast

    summary = []
    forecast_summary[:daily][:data].each do |f|
      summary << Summary.new(f[:summary], f[:time])
    end

    # summary = forecast_summary[:daily][:data].first[:summary]
    render json: GifsFacade.new(forecast_summary).return_gifs
  end
end
