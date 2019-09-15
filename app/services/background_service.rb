class BackgroundService
  def initialize(location)
    @location = location
  end

  def retrieve_background
    unsplash_response
  end

  private
    attr_reader :location

    def unsplash_connection
        Faraday.new(:url => 'https://api.unsplash.com') do |f|
        f.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
        f.params['query'] = location
        f.adapter  Faraday.default_adapter
      end
    end

    def unsplash_response
      response = unsplash_connection.get '/photos/random'
      JSON.parse(response.body, symbolize_names: true)[:urls][:full]
    end
end
