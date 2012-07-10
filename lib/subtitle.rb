class Subtitle
  attr_accessor :lineno, :time_start, :time_end, :content

  def initialize lineno, time_start, time_end, content
    @lineno = lineno
    @time_start = time_to_float time_start
    @time_end = time_to_float time_end
    @content = content
  end

  def to_s
    subs = <<-eos.gsub(/^ {6}/, '')
      #{@lineno}
      #{time_start} --> #{time_end}
      #{@content}
    eos

    subs
  end

  def time_start
    float_to_time @time_start
  end

  def time_end
    float_to_time @time_end
  end

  def time_start= starting 
    @time_start = time_to_float starting
  end

  def time_end= ending 
    @time_end = time_to_float ending
  end

  private

  def time_to_float time
    h,m,s,ms = time.split(/:|,/).map(&:to_f)
    h*60*60 + m*60 + s + ms/1000.0
  end

  def float_to_time floatn
    h = "%02d" % (floatn/3600).to_i
    m = "%02d" % ((floatn/60) % 60).to_i
    s = "%02d" % (floatn % 60).to_i
    ms = ((floatn - floatn.to_i) * 1000).round
    "#{h}:#{m}:#{s},#{ms}"
  end
end
