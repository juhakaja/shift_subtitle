module FloatTime
  def time_to_float time
    h,m,s,ms = time.split(/:|,/).map(&:to_f)
    h*60*60 + m*60 + s + ms/1000.0
  end

  def float_to_time float
    h = "%02d" % (float/3600).to_i
    m = "%02d" % ((float/60) % 60).to_i
    s = "%02d" % (float % 60).to_i
    ms = "%03d" % ((float - float.to_i) * 1000).round
    "#{h}:#{m}:#{s},#{ms}"
  end
end
