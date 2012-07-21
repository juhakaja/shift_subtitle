require 'spec_helper'

describe SrtSubtitles do

  let(:title) { "Foo Bar" }
  let(:srt) { SrtSubtitles.new title }

  it "should be able to create an instance" do
    srt.should_not be_nil
  end

  it "should have a title" do
    srt.title.should == "Foo Bar"
  end

  it "should have a blocks -array" do
    srt.blocks.should be_an_instance_of Array
  end

  it "should return all subtitles if to_s" do
    srt.blocks << ["foo", "bar"]
    srt.to_s.should == ["foo", "bar"].join("\n")
  end

  it "should have a shift method" do
    srt.shift_time 2.500
  end
end
