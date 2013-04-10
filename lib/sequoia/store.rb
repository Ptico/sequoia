module Sequoia
  ##
  # Class: Simple container to store internal config
  #
  # It exists only to make a difference between hash value and internal data
  #
  class Store < ::Hash

    def deep_merge!(store)
      store.each_pair do |key, value|
        if self[key].is_a?(Store) && value.kind_of?(Hash)
          self[key].deep_merge!(value)
        else
          self[key] = value
        end
      end

      self
    end

  private

    ##
    # Private: Initialize new Store
    #
    # Params:
    # - hash {Hash} Hash object to convert
    #
    def initialize(hash={})
      merge!(hash)
    end
  end
end