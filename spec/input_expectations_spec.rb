require 'spec_helper'

require './lib/input_expectations'
require './lib/expectation_object'

describe InputExpectations do
  describe "::expect method" do

    before do
      class TestClass
        extend InputExpectations
      end
    end

    it "creates instance of ExpectationObject" do
      (TestClass.expect({}).class).should == ExpectationObject
    end
  end
end
