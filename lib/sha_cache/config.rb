module ShaCache
  class Config
    def self.config
      yield(self)
    end

    def self.adapter
      @adapter ||= Adapter::Null.new
    end

    def self.adapter=(adapter)
      @adapter = adapter
    end
  end
end
