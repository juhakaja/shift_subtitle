require 'spec_helper'

describe SrtReader do

  let(:filename) { "Foo Bar" }
  let(:srt_reader) { SrtReader.new filename }
  let(:content) { 
    <<-eos.gsub(/^ {6}/, '')
      645
      01:31:51,210 --> 01:31:54,893
      the government is implementing a new policy...

      646
      01:31:55,412 --> 01:31:56,192
      to raise taxes,
      ad infinitum
    eos
  }

  it "should read file" do
    File.stub(:read).with(filename).and_return content
    srt_reader.load_file.should == content.chomp
  end

  it "should have a filename" do
    srt_reader.filename.should == filename
  end

  it "should should return content blocks in array" do
    File.stub(:read).with(filename).and_return content
    blocks = srt_reader.by_block
    blocks.should be_an_instance_of Array
    blocks.first.should == content.split(/\n\n/).first
  end
end
