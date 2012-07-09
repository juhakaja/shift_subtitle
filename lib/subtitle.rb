class Subtitle
  attr_accessor :lineno, :time_start, :time_end, :content

  def initialize lineno, time_start, time_end, content
    @lineno = lineno
    @time_start = maketime(time_start)
    @time_end = maketime(time_end)
    @content = content
  end

  def time_start
    @time_start.strftime("%H:%M:%S,%L")
  end

  def time_end
    @time_end.strftime("%H:%M:%S,%L")
  end

  private

  def basetime
    Time.at(0).utc
  end

  def maketime time
    h,m,s,ms = time.split(/:|,/).map(&:to_i)
    Time.at(h*60*60 + m*60 + s + ms.to_f/1000.0).utc
  end
end
