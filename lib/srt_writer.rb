class SrtWriter
  attr_accessor :filename

  def initialize filename
    @filename = filename
  end

  def dump content
    File.open(@filename, 'w') { |f| f.write content }
  end
end
