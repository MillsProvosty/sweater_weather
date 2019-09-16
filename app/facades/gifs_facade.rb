class GifsFacade
  def initialize(query)
    @query = query
  end


  def return_gifs
    render json: GifsService.new(query)
  end

  private
    attr_reader :query
end
