module ShaCache
  module Adapter
    class Redis
      def self.config
        yield(self)
      end

      def self.get_data_by_key(key)
        redis_obj.get(key)
      end

      def self.write_data(key, sha)
        redis_obj.set(key, sha)
      end

      def self.redis_obj=(redis_obj)
        @redis_obj = redis_obj
      end

      def self.redis_obj
        @redis_obj 
      end
      
    end
  end
end
