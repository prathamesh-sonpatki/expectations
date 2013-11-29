# require "expectations/version"

module Expectations
  def expect(obj)
    ExpcetationObject.new(obj)
  end
end

class ExpcetationObject
  def initialize(obj)
    @object = obj
  end

  def to_have_key(key)
    raise ArgumentError unless @object.is_a? Hash
    yield if @object.keys.include?(key) == false
  end
end


# Example

# extend Expcetations

# expect(params).to_have_key(:user) do
#   "Invalid input. Expected key :user to be present"
# end
