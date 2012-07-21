
require 'lib/subtitles'
require 'lib/srt_builder'

srt = SrtBuilder::build 'tmp/subtitles.srt'

srt.shift_time 2.500

SrtIO::Writer.new('tmp/s2.srt') { srt }
