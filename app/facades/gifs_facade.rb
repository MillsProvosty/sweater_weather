class GifsFacade
  def initialize(query)
    @query = query
  end

  def return_gifs
    GifsService.new(query).search_gifs
  end

  private
    attr_reader :query
end
