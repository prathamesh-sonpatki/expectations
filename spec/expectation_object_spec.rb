require 'spec_helper'
require './lib/input_expectations'
require './lib/expectation_object'

describe ExpectationObject do
  include InputExpectations
  describe "#to_have_key" do
    it "checks if the object is hash or not" do
      params = {:user => "Prathamesh"}
      (expect(params).to have_key(:user)).should == true
      (expect(params).not_to have_key(:user)).should == false
      #expect(obj.errors).to eq ["Expected Hash. Found Fixnum.", "Expected key :user to be present. Not found."]
    end

    it "checks if given key is present in the object or not" do
      (expect({}).to have_key(:user)).should == false
      #expect(@exp_object.errors).to eq ["Expected key :user to be present. Not found."]
    end

    it "returns true if the key is present in the object" do
      exp_object ={:user => "Prathamesh" }
      (expect(exp_object).to have_key(:user)).should ==  true
      #expect(exp_object.errors).to eq []
    end

    it "yield the given block if key is not present in the object and block is given" do
      result = expect({}).to have_key(:user) do |obj|
        obj.errors.join(", ")
      end
      result.should == "Expected key :user to be present. Not found."
    end
  end
end
