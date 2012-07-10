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
    subtitle.private_methods(false).sort.should == [:initialize, :time_to_float, :float_to_time].sort
  end

  it "should have time_to_float which converts times to float" do
    subtitle.send(:time_to_float,"01:31:51,210").should == 5511.21
    subtitle.send(:time_to_float,"25:31:51,210").should == 91911.21
  end

  it "should have float_to_time to convert float to time" do
    subtitle.send(:float_to_time, 5511.21).should == "01:31:51,210"
    subtitle.send(:float_to_time, 91911.21).should == "25:31:51,210"
    subtitle.send(:float_to_time, 91911.01).should == "25:31:51,010"
  end

  it "should have line number" do
    subtitle.lineno.should == 645
  end

  it "should have a instance variable @time_start and it should be Float" do
    subtitle.instance_variable_get("@time_start").should be_an_instance_of Float
  end

  it "should have a instance variable @time_start and it should be Float" do
    subtitle.instance_variable_get("@time_start").should be_an_instance_of Float
  end

  it "should have time_start" do
    subtitle.time_start.should == "01:31:51,210"
  end

  it "should have time_end" do
    subtitle.time_end.should == "01:31:54,893"
  end

  it "should allow changing time_start" do
    subtitle.time_start = "02:31:51,210"
    subtitle.instance_variable_get("@time_start").should be_an_instance_of Float
    subtitle.time_start.should == "02:31:51,210"
  end

  it "should allow changing time_end" do
    subtitle.time_end = "02:31:54,893"
    subtitle.instance_variable_get("@time_end").should be_an_instance_of Float
    subtitle.time_end.should == "02:31:54,893"
  end

  it "should have content" do
    subtitle.content.should == "the government is implementing a new policy..."
  end

  it "should have to_s that prints the subtitle" do
    subtitle.to_s.should == <<-eos.gsub(/^ {6}/, '')
      645
      01:31:51,210 --> 01:31:54,893
      the government is implementing a new policy...
    eos
  end

  it "should shift time" do
    subtitle.shift_time 0.250
    subtitle.time_start.should == "01:31:51,460"
    subtitle.time_end.should == "01:31:55,143"
    subtitle.shift_time 8.550
    subtitle.time_start.should == "01:32:00,010"
    subtitle.time_end.should == "01:32:03,693"
    subtitle.shift_time 24*60*60 + 30*60
    subtitle.time_start.should == "26:02:00,010"
    subtitle.time_end.should == "26:02:03,693"
    subtitle.shift_time -2.500
    subtitle.time_start.should == "26:01:57,510"
    subtitle.time_end.should == "26:02:01,193"
  end
end
