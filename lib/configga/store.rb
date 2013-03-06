module Configga
  ##
  # Class: Simple container to store internal config
  #
  # It exists only to make a difference between hash value and internal data
  #
  class Store < ::Hash
  private

    ##
    # Private: Initialize new Store
    #
    # Params:
    # - hash {Hash} Hash object to convert
    #
    def initialize(hash={})
      super(nil)
      self.merge!(hash)
    end
  end
end