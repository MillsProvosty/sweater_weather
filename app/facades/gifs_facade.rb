class GifsFacade
  def initialize(query)
    @query = query
  end

  def return_gifs
    GifsService.new(query).search_gifs[:data].first[:images][:original_still][:url]
  end

  private
    attr_reader :query
end
