class GifsService
  def initialize(summary)
    @summary= summary
  end

  def search_gifs
    giphy_response
  end

  private
    attr_reader :summary

    def giphy_connection
      Faraday.new(:url => 'http://api.giphy.com') do |f|
        f.params['api_key'] = ENV['GIPHY_API_KEY']
        f.params['q'] = summary
        f.adapter  Faraday.default_adapter
      end
    end

    def giphy_response
      response = giphy_connection.get '/v1/gifs/search'
      JSON.parse(response.body, symbolize_names: true)
    end
end
