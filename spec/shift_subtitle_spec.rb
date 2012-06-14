require 'spec_helper'

describe ShiftSubtitle do

  let(:subtitle) { ShiftSubtitle.new }
  let(:filename) { "subtitles" }
  let(:content) { "foo bar" }

  it 'should be able to create an instance' do
    ShiftSubtitle.new.should_not be_nil
  end

  it 'should read file' do
    File.stub(:read).with(filename).and_return(content)
    subtitle.import(filename).should eq(content)
  end
end
