
require 'lib/subtitles'
require 'lib/srt_builder'

srt = SrtBuilder::build 'tmp/subtitles.srt'

SrtIO::Writer.new('tmp/s2.srt') { srt }
