module Configga

  ##
  # Class: Resulting storage of configuration data
  #
  # Once it initialized - it can't be modified
  #
  class Entity < Struct

    ##
    # Factory: Create new instance of entity
    #
    # Returns: {Configga::Entity}
    def self.create(store)
      keys = store.keys

      values = store.values.map do |value|
        value.class == Store ? create(value) : value
      end

      new(*keys).new(*values)
    end

    ##
    # Convert content of entity to hash
    #
    # TODO: Deep #to_hash
    #
    # Returns: {Hash} Hash of all keys and values
    #
    def to_hash
      members.each_with_object({}) { |key, obj| obj[key] = self[key] }
    end

    ##
    # Represent content of entity as hash string
    #
    # Returns: {String} String with keys and values in hash format
    #
    def to_s
      to_hash.to_s
    end
    alias :inspect :to_s

    ##
    # Returns: {String} a pretty printed object
    #
    def pretty_inspect
      PP.pp(to_hash, '')
    end

  private

    ##
    # Private: Initialize and freeze the struct class
    #
    def initialize(*)
      super
      freeze
    end

  end
end