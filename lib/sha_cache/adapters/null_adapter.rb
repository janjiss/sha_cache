module ShaCahce
  module Adapter
    class Null
      def initialize
        raise AdapterNotSpecified.new("Adapter not specified")
      end
    end
    class AdapterNotSpecified < Exception; end;
  end
end

