module ShaCache
  class Config
    def self.config
      yield
    end

    def self.adapter
      @adapter ||= Adapter::Null.new
    end

    def self.use(adapter)
      @adapter = adapter
    end

    def self.adapter=(adapter)
      @adapter = adapter
    end
  end
end
