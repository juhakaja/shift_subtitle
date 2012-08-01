#!/usr/bin/env ruby

require 'optparse'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'subtitles'))

options = {}
optparse = OptionParser.new do |opts|
  opts.banner = "Shifts time in SRT file"

  options[:operation] = nil
  opts.on("-o", "--operation OPT", [:add, :sub], 
          "Accept either 'add' or 'sub' to add or subtract times") do |operation|
    options[:operation] = operation == :add ? '+' : '-'
  end

  options[:time] = nil
  opts.on("-t", "--time OPT", 
          "Shift time in the format 11,222 where '11' is seconds and '222' milliseconds") do |time|
    options[:time] = time
  end
  
  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end
optparse.parse!

options[:input_file] = ARGV[0] or raise ArgumentError, "No input-file!"
options[:output_file] = ARGV[1] or raise ArgumentError, "No output-file!"

time = (options[:operation].to_s + options[:time].to_s.sub(/,/,".")).to_f


SrtSubtitles::Subs.new("my_subtitles") do |subs|
  subs.add_text File.read(options[:input_file])
  subs.shift_time time
  File.open(options[:output_file], 'w') { |f| f.puts subs }
end
