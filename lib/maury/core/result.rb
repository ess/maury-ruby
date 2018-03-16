module Maury
  module Core

    class Result
      def initialize(value: nil, error: nil)
        @value = value
        @error = error
      end

      def ok?
        error.nil?
      end

      def error
        @error
      end

      def value
        return @value if ok?

        nil
      end
    end
  end

end
