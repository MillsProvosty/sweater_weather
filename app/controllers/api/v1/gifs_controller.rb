class Api::V1::GifsController < ApplicationController
  def index
    GatherService.new(params[:location]).return_all_the_stuff
    # forecast_summary = ForecastFacade.new(params[:location]).return_forecast
    #
    # summaries = []
    # forecast_summary[:daily][:data][0..4].each do |f|
    #   summaries << Summary.new(f[:summary], f[:time])
    # end
    #
    # gif_urls = []
    # summaries.map do |s|
    #   gif_urls << GifsFacade.new(s.summary).return_gifs
    # end

    render json: GiphySearch.new(summaries, gif_urls).renders_hash
  end
end
