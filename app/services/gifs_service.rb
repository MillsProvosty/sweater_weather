class GifsService
  def initialize(summary)
    @summary= summary
  end

  def search_gifs

  conn = Faraday.new(:url => 'http://api.giphy.com') do |f|
    f.params['api_key'] = ENV['GIPHY_API_KEY']
    f.params['q'] = summary
    f.adapter  Faraday.default_adapter
  end

  response = conn.get '/v1/gifs/search'
  url = JSON.parse(response.body, symbolize_names: true)[:data].first[:images][:original_still][:url]
  end

  private
    attr_reader :summary
end
