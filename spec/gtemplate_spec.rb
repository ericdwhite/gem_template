require 'spec_helper'

describe Gtemplate do
  it "should have a VERSION" do
    Gtemplate::VERSION::STRING.should == "0.0.2"
  end
end
