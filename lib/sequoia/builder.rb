module Sequoia

  ##
  # Class: Config builder
  #
  # Yields the block with definitions and then build keys and values
  # Also works as a chainable builder
  #
  class Builder < BasicObject
    ##
    # Storage for builded attributes
    #
    attr_reader :attrs

    ##
    # Public: Returns the class of +obj+.
    #
    # This method must always be called with an explicit receiver, as +class+ is also a reserved word in Ruby.
    #
    def class
      Builder
    end

  private

    ##
    # Private: Initialize a new Builder
    #
    # Params:
    # - attrs {Sequoia::Store} For internal use only (optional)
    #
    # Yields: block with key-value definitions
    #
    def initialize(attrs=Store.new, &block)
      @attrs = attrs
      instance_eval(&block) if ::Kernel.block_given?
    end

    ##
    # Private: Method missing handler
    #
    # This is where all the magic happens
    #
    # Params:
    # - method_name {Symbol} Method name
    # - args        {Array}  Array of arguments sended to the method
    #
    # Yields: Block with nested definitions
    #
    def method_missing(method_name, *args, &block)
      key   = normalize_method_name(method_name)
      value = normalize_arguments(args, &block)

      result = attrs[key] ||= (args.length > 0 || ::Kernel.block_given? ? value : Store.new)
      result.is_a?(Store) ? self.class.new(result) : result
    end

    ##
    # Private: Of course we respond to any key name
    #
    def respond_to_missing?(*)
      true
    end

    ##
    # Private: Remove trailing `=` from getter name if exists
    #
    # Params:
    # - method_name {Symbol} Method name
    #
    # Returns: {Symbol} Normalized method name
    #
    def normalize_method_name(method_name)
      method_string = method_name.to_s
      method_string.chop! if method_string.end_with?('=')
      method_string.to_sym
    end

    ##
    # Private: Get value for assignment
    #
    # Params:
    # - args {Array} Array of arguments
    #
    # Yields: Block with nested definitions
    #
    # Returns: Result of nested Builder#attrs or first argument from args or
    #          array of arguments if args.length > 1 or nil
    #
    def normalize_arguments(args, &block)
      if ::Kernel.block_given?
        self.class.new(&block).attrs
      else
        args.length > 1 ? args : args[0]
      end
    end

  end
end