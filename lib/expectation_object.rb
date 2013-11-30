require 'expectations_by_object'

class ExpectationObject
  include ExpectationsByObject
  attr_accessor :errors

  def initialize(obj)
    @object = obj
    @errors = []
  end
end
