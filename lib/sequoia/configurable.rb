require 'sequoia/entity'

module Sequoia
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
    # Returns: {Sequoia::Builder} builder instance
    #
    def configure(env=:default, &block)
      environment = config_attributes[env.to_sym]

      Builder.new(environment, &block)
    end

    ##
    # Build configuration object
    #
    # Params:
    # - env {Symbol} Environment to build
    #
    # Returns: {Sequoia::Entity} builded configuration object
    #
    def build_configuration(env=nil)
      result = config_attributes[:default]
      result.deep_merge!(config_attributes[env.to_sym]) if env
      Entity.create(result)
    end
    alias :build_config :build_configuration

  protected

    ##
    # Config environments storage
    #
    def config_attributes
      @config_attributes ||= Hash.new { |hash, key| hash[key] = Store.new }
    end

  end
end
