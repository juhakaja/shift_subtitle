class SrtSubtitles
  attr_accessor :title, :blocks

  def initialize title
    @title = title
    @blocks = []

    yield(self) if block_given?
  end

  def to_s
    @blocks.join("\n")
  end

  def <<(blocks)
    @blocks << blocks
  end
end
