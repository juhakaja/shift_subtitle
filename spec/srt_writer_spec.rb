require 'spec_helper'

describe SrtWriter do

  let(:filename) { "Foo Bar" }
  let(:srt_writer) { SrtWriter.new filename }
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
    file = mock 'file'
    File.should_receive(:open).with(filename, "w").and_yield(file)
    file.should_receive(:write).with(content)
    srt_writer.dump content
  end

  it "should have a filename" do
    srt_writer.filename.should == filename
  end
end
