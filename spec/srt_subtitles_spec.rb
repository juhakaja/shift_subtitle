require 'spec_helper'

describe SrtSubtitles do

  describe SrtSubtitles::Block do
  
    let(:lineno) { 645 }
    let(:time_start) { "01:31:51,210" }
    let(:time_end) { "01:31:54,893" }
    let(:content) { "the government is implementing a new policy..." }
    let(:block) {
      <<-eos.gsub(/^ {8}/, '')
        645
        01:31:51,210 --> 01:31:54,893
        the government is implementing a new policy...
      eos
    }
    let(:srt) { SrtSubtitles::Block.new block }
  
    it "should be able to create an instance" do
      srt.should_not be_nil
    end
  
    it "should have time_to_float which converts times to float" do
      srt.send(:time_to_float,"01:31:51,210").should == 5511.21
      srt.send(:time_to_float,"25:31:51,210").should == 91911.21
    end
  
    it "should have float_to_time to convert float to time" do
      srt.send(:float_to_time, 5511.21).should == "01:31:51,210"
      srt.send(:float_to_time, 91911.21).should == "25:31:51,210"
      srt.send(:float_to_time, 91911.01).should == "25:31:51,010"
    end
  
    it "should have line number" do
      srt.lineno.should == 645
    end
  
    it "should have a instance variable @time_start and it should be Float" do
      srt.instance_variable_get("@time_start").should be_an_instance_of Float
    end
  
    it "should have a instance variable @time_start and it should be Float" do
      srt.instance_variable_get("@time_start").should be_an_instance_of Float
    end
  
    it "should have time_start" do
      srt.time_start.should == "01:31:51,210"
    end
  
    it "should have time_end" do
      srt.time_end.should == "01:31:54,893"
    end
  
    it "should allow changing time_start" do
      srt.time_start = "02:31:51,210"
      srt.instance_variable_get("@time_start").should be_an_instance_of Float
      srt.time_start.should == "02:31:51,210"
    end
  
    it "should allow changing time_end" do
      srt.time_end = "02:31:54,893"
      srt.instance_variable_get("@time_end").should be_an_instance_of Float
      srt.time_end.should == "02:31:54,893"
    end
  
    it "should have content" do
      srt.content.should == "the government is implementing a new policy..."
    end
  
    it "should have to_s that prints the block" do
      srt.to_s.should == <<-eos.gsub(/^ {8}/, '')
        645
        01:31:51,210 --> 01:31:54,893
        the government is implementing a new policy...
      eos
    end
  
    it "should shift time" do
      srt.shift_time 0.250
      srt.time_start.should == "01:31:51,460"
      srt.time_end.should == "01:31:55,143"
      srt.shift_time 8.550
      srt.time_start.should == "01:32:00,010"
      srt.time_end.should == "01:32:03,693"
      srt.shift_time 24*60*60 + 30*60
      srt.time_start.should == "26:02:00,010"
      srt.time_end.should == "26:02:03,693"
      srt.shift_time -2.500
      srt.time_start.should == "26:01:57,510"
      srt.time_end.should == "26:02:01,193"
    end
  end
  
  describe SrtSubtitles::Subs do
  
    let(:title) { "Foo Bar" }
    let(:srt) { SrtSubtitles::Subs.new title }
  
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
end
