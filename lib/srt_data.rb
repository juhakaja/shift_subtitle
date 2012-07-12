class SrtData
  attr_accessor :title, :blocks

  def initialize title
    @title = title
    @blocks = []
  end

  def to_s
    @blocks.join("\n")
  end
end
