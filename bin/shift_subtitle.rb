
require 'lib/subtitles'

def testing
  file = 'tmp/subtitles.srt'

  content = SrtIO::Reader.new(file).by_block

  srt_sub = SrtSubtitles.new("my_subtitles") do |srt_block|
    content.each do |block| 
      block = block.split("\n")
      lineno = block[0]
      time_start, time_end = block[1].split(" --> ")
      content = block.drop(2).join("\n")

      subtitle = SrtBlock.new lineno, time_start, time_end, content

      srt_block << subtitle
    end
  end

  return srt_sub
end
