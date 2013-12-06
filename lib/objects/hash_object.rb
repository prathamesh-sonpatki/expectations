module HashObject
  def to_have_key(key)
    return true if self.should_be_hash && @object.has_key?(key)
    @errors << "Expected key #{key.inspect} to be present. Not found."
    return yield(self) if block_given?
    false
  end

  def should_be_hash
    return true if @object.is_a? Hash
    @errors << "Expected Hash. Found #{@object.class}."
    false
  end
end
