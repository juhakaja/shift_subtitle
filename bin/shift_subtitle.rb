
require 'lib/srt_reader'
require 'lib/srt_data'
require 'lib/subtitle'


def testing
  file = 'tmp/subtitles.srt'

  content = SrtReader.new(file).by_block

  srt_data = SrtData.new("my_subtitles")

  content.each do |block| 
    block = block.split("\n")
    lineno = block[0]
    time_start, time_end = block[1].split(" --> ")
    content = block.drop(2).join("\n")

    subtitle = Subtitle.new lineno, time_start, time_end, content

    srt_data.blocks << subtitle
  end

  return srt_data
end
