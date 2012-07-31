module SrtSubtitles
  class Block
    attr_reader :lineno, :time_start, :time_end, :content

    include FloatTime
  
    def initialize block
      block = block.split "\n"
      @lineno = block[0].to_i
      @time_start, @time_end = block[1].split(" --> ").map { |b| time_to_float b }
      @content = block.drop(2).join("\n")
    end
  
    def to_s
      <<-eos.gsub(/^ {8}/, '')
        #{@lineno}
        #{time_start} --> #{time_end}
        #{@content}
      eos
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
  
    def shift_time shift
      @time_start += shift
      @time_end += shift
    end
  end
  
  class Subs
    attr_reader :blocks
    attr_accessor :title
  
    def initialize title
      @title = title
      @blocks = []
  
      yield(self) if block_given?
    end
  
    def to_s
      @blocks.join "\n"
    end
  
    def <<(block)
      add_block block
    end

    def add_block block
      @blocks << Block.new(block)
    end
  
    def shift_time shift
      @blocks.each { |block| block.shift_time shift }
    end
  end
end
