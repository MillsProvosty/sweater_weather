class Summary
  attr_reader :summary,
              :time

  def initialize(summary, time)
    @summary = summary
    @time = time
    binding.pry
  end
end
