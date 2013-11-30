require 'spec_helper'
require './lib/expectation_object'

describe ExpectationObject do

  describe "#to_have_key" do
    before do
      @exp_object = ExpectationObject.new({})
    end

    it "checks if the object is hash or not" do
      obj = ExpectationObject.new(42)
      expect(obj.to_have_key(:user)).to be false
      expect(obj.errors).to eq ["Expected Hash. Found Fixnum.", "Expected key :user to be present. Not found."]
    end

    it "checks if given key is present in the object or not" do
      expect(@exp_object.to_have_key(:user)).to be false
      expect(@exp_object.errors).to eq ["Expected key :user to be present. Not found."]
    end

    it "returns true if the key is present in the object" do
      exp_object = ExpectationObject.new({:user => "Prathamesh" })
      expect(exp_object.to_have_key(:user)).to be true
      expect(exp_object.errors).to eq []
    end

    it "yield the given block if key is not present in the object and block is given" do
      result = @exp_object.to_have_key(:user) do |obj|
        obj.errors.join(", ")
      end
      expect(result).to eq "Expected key :user to be present. Not found."
    end
  end
end
