class BackgroundFacade
  def initialize(location)
    @location = location
  end

  def return_background
    conn = Faraday.new(:url => 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['UNSPLASH_ACCESS_KEY']
      f.params['query'] = location
      f.adapter  Faraday.default_adapter
    end

    response = conn.get '/photos/random'
    JSON.parse(response.body, symbolize_names: true)[:urls][:full]
  end

  private
    attr_reader :location
end
