require "bumbleworks/storage_adapter"
require "ruote-redis"

module Bumbleworks
  module Redis
    class Adapter < Bumbleworks::StorageAdapter
      class << self
        def driver
          ::Ruote::Redis::Storage
        end

        def storage_class
          ::Redis
        end
      end
    end
  end
end
