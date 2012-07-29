module SrtBuilder
  def self.build file
    content = SrtIO::Reader.new(file).by_block

    srt_sub = SrtSubtitles::Subs.new("my_subtitles") do |srt_block|
      content.each do |block| 
        block = block.split "\n"
        lineno = block[0]
        time_start, time_end = block[1].split(" --> ")
        content = block.drop(2).join("\n")

        srt_block.add_block(:lineno => lineno, :time_start => time_start, 
                            :time_end => time_end, :content => content)
      end
    end
  end
end
