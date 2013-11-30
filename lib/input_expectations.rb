# require "expectations/version"
require 'expectation_object'

module InputExpectations
  def expect(obj)
    ExpectationObject.new(obj)
  end
end


# Example

# extend InputExpectations

# expect(params).to_have_key(:user) do
#   "Invalid input. Expected key :user to be present"
# end
