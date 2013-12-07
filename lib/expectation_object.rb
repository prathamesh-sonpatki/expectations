class ExpectationObject
  attr_accessor :errors

  def initialize(obj)
    @object = obj
    @errors = []
  end

  def to(matcher, &block)
    result = matcher.matches?(@object)
    return true if result == true
    @errors << matcher.failure_description if result == false
    Proc.new { return block.call(self) }.call if block_given? && result == false
    Proc.new { return matcher.block.call(self) }.call unless matcher.block.nil?
    false
  end

  def not_to(matcher)
    result = matcher.matches?(@object)
    return true if result == false
    return yield(self) if block_given? && result == true
    false
  end
end
