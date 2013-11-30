class ExpectationObject
  attr_accessor :errors

  def initialize(obj)
    @object = obj
    @errors = []
  end

  def to_have_key(key)
    return true if self.should_be_hash && @object.keys.include?(key)
    @errors << "Expected key #{key.inspect} to be present. Not found."
    false
  end

  def should_be_hash
    return true if @object.is_a? Hash
    @errors << "Expected Hash. Found #{@object.class}."
    false
  end
end
