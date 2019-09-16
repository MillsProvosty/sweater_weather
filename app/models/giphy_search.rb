class GiphySearch
  def initialize(summaries, urls)
    @summaries = summaries
    @urls = urls
  end

  def renders_hash
    copyright = "2019"
    {data: {images: final_hash }, copyright: copyright }
  end

  def summary_portion
     @summaries.map do |s|
          {
          time: s.time,
          summary: s.summary,
          url: nil
        }
    end
  end

  def final_hash
    summary_portion.each_with_index do |object, index|
      if object[:url] == nil
        object[:url] = @urls[index]
      end
    end
  end
end
