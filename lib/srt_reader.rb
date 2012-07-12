class SrtReader
  attr_accessor :filename

  def initialize filename
    @filename = filename
    @subtitle_container = []
  end

  def load_file
    File.read(@filename).chomp
  end

  def by_block
    load_file.split(/\n\n/)
  end
end