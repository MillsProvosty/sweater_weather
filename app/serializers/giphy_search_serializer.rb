class GiphySearchSerializer
  def initialize(summaries, urls)
    @summaries = summaries
    @urls = urls
  end

  def renders_hash
    hash = @summaries.map do |s|
          {
          time: s.time,
          summary: s.summary,
          url: nil
        }
    end

    hash.each_with_index do |object, index|
        if object[:url] == nil
          object[:url] = @urls[index]
      end
      binding.pry
    end
  end
end
