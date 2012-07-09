require 'spec_helper'

describe Subtitle do

  let(:lineno) { 645 }
  let(:time_start) { "01:31:51,210" }
  let(:time_end) { "01:31:54,893" }
  let(:content) { "the government is implementing a new policy..." }
  let(:subtitle) { Subtitle.new lineno, time_start, time_end, content }

  it "should be able to create an instance" do
    subtitle.should_not be_nil
  end

  it "should have private methods" do
    subtitle.private_methods(false).sort.should == [:initialize, :basetime, :maketime].sort
  end

  it "should have a basetime set to UTC 0" do
    subtitle.send(:basetime).should == Time.at(0).utc
  end

  it "should have maketime which adds time_start and end to basetime" do
    subtitle.send(:maketime,"01:31:51,210").should == Time.at(01*60*60 + 31*60 + 51 + 210/1000.0)
  end

  it "should have line number" do
    subtitle.lineno.should == 645
  end

  it "should have a instance variable @time_start and it should be Time" do
    subtitle.instance_variable_get("@time_start").should be_an_instance_of Time
  end

  it "should have a instance variable @time_start and it should be Time" do
    subtitle.instance_variable_get("@time_start").should be_an_instance_of Time
  end

  it "should have time_start" do
    subtitle.time_start.should == "01:31:51,210"
  end

  it "should have time_end" do
    subtitle.time_end.should == "01:31:54,893"
  end

  it "should have content" do
    subtitle.content.should == "the government is implementing a new policy..."
  end
end
