require 'spec_helper'

describe FloatTime do

  let(:time_start) { "01:31:51,210" }
  let(:time_end) { "01:31:54,893" }
  let(:float_time) { Class.new.extend(FloatTime) }

  it "should have time_to_float which converts times to float" do
    float_time.time_to_float("01:31:51,210").should == 5511.21
    float_time.time_to_float("25:31:51,210").should == 91911.21
  end

  it "should have float_to_time to convert float to time" do
    float_time.float_to_time(5511.21).should == "01:31:51,210"
    float_time.float_to_time(91911.21).should == "25:31:51,210"
    float_time.float_to_time(91911.01).should == "25:31:51,010"
  end
end
