class Api::V1::GifsController < ApplicationController
  def index
    #I need code that will get the 5 day forecast passing in params[:location] CHECK

    #take that 5 day array of forecasts, and create an array of summary objects with time and summary (PORO)

    #pass that array of summaryobject.summary into a giphy service that will search and return 5 gifs
    #a serializer?? or facade?? that will pass in both the summaries and gifs, rendering it in the format expected.


    forecast_summary = ForecastFacade.new(params[:location]).return_forecast

    summaries = []
    forecast_summary[:daily][:data][0..4].each do |f|
      summaries << Summary.new(f[:summary], f[:time])
    end

    gif_urls = []
    summary.map do |s|
      gif_urls << GifsFacade.new(s.summary).return_gifs
    end

    render json: GiphySearchSerializer.new(summaries, gif_urls)

    binding.pry
  end
end
