class SrtReader
  attr_accessor :filename

  def initialize filename
    @filename = filename
  end

  def load_file
    File.read @filename
  end
end
