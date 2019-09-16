class GiphySearch
  def initialize(summaries, urls)
    @summaries = summaries
    @urls = urls
  end

  def renders_hash
    copyright = "2019"
    {data: {images: sorts_info }, copyright: copyright }
  end

  def sorts_info
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
    end
    hash.flatten
  end
end
