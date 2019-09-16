class GifsFacade
  def initialize(query)
    @query = query
  end

  def return_gifs
    conn = Faraday.new(:url => 'http://api.giphy.com') do |f|
      f.params['api_key'] = ENV['GIPHY_API_KEY']
      f.params['q'] = query
      f.params['limit'] = 5
      f.adapter  Faraday.default_adapter
    end

    response = conn.get '/v1/gifs/search'
    this = JSON.parse(response.body)
    binding.pry
  end

  private
    attr_reader :query
end
