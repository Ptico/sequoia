require 'configga/entity'

module Configga
  ##
  # Module: Configurable mixin
  #
  module Configurable

    ##
    # Add or merge environment configuration
    #
    # Params:
    # - env {Symbol} Environment to set (optional, default: :default)
    #
    # Yields: block with key-value definitions
    #
    # Returns: {Configga::Builder} builder instance
    #
    def configure(env=:default, &block)
      environment = @config_attributes[env.to_sym] ||= Store.new

      Builder.new(environment, &block)
    end

    ##
    # Build configuration object
    #
    # Params:
    # - env {Symbol} Environment to build
    #
    # Returns: {Configga::Entity} builded configuration object
    #
    def build(env=nil)
      result = @config_attributes[:default]
      result.deep_merge(@config_attributes[env.to_sym]) if env
      Entity.create(result)
    end

  private

    def initialize(*)
      @config_attributes = { default: Store.new }
      super
    end

  end
end