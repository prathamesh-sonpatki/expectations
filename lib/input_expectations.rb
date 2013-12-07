require 'expectation_object'
require 'matchers/has'

module InputExpectations
  def expect(obj)
    ExpectationObject.new(obj)
  end

  def method_missing(method, *args, &block)
    InputExpectations::Has.new(method, *args, &block) if (method =~ /have/)
  end
end
