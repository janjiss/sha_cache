require 'digest/sha1'
module ShaCache
  class Client
    def self.data_was_used?(key, body)
      data = adapter.get_data_by_key(key)
      data == convert_to_sha(body)
    end

    def self.write_data(key, body)
      data = convert_to_sha(body)
      adapter.write_data(key, data)
    end

    def self.convert_to_sha(body)
      Digest::SHA1.hexidigest(body)  
    end

    def self.adapter
      @adapter ||= Config.adapter 
    end
  end
end
