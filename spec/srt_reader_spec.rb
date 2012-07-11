require 'spec_helper'

describe SrtReader do

  let(:filename) { "Foo Bar" }
  let(:content) { "foobar" }
  let(:srt_reader) { SrtReader.new filename }

  it 'should read file' do
    File.stub(:read).with(filename).and_return content
    srt_reader.load_file.should == content
  end

  it 'should have a filename' do
    srt_reader.filename.should == filename
  end
end
