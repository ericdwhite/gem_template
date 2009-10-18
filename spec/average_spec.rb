require 'spec_helper'

describe Average do
  it "should average 4 numbers" do
    sampler = flexmock("Floating point sampler")
    sampler.should_receive(:sample).times(4).
      and_return(1.2, 12, 4, 13.5)

    average = Average.new(sampler)
    average.average_of(4).should == 7.675
  end
end
