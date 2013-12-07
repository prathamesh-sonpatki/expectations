require 'input_expectations'
module InputExpectations
  class Has
    attr_accessor :block
    def initialize(expected, *args, &blk)
      @expected = expected
      @args     = args
      @block    = blk
    end

    def matches?(actual)
      @actual = actual
      @actual.__send__(method_name.to_sym, *@args)
    end

    def failure_description
      "Expected #{@expected.to_s.gsub('have_','')} #{@args.map(&:inspect).join(', ')} to be present. Not found."
    end

    def method_name
      "#{@expected.to_s.sub('have', 'has')}?"
    end
  end
end
