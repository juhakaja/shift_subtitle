module SrtIO
  class Reader
    attr_accessor :filename

    def initialize filename
      @filename = filename
    end

    def to_s
      load_file
    end

    def load_file
      File.read(@filename).chomp
    end

    def by_block
      load_file.split(/\n\n/)
    end
  end

  class Writer
    attr_accessor :filename

    def initialize filename
      @filename = filename

      dump(yield) if block_given?
    end

    def dump content
      File.open(@filename, 'w') { |f| f.write content }
    end
  end
end