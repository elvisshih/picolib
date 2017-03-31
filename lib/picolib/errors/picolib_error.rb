module Picolib
  module Errors
    class Messages

      BASE_KEY = "picolib.errors.messages"

      def initialize(key, attributes = {})
        translate_error_message(key, attributes)
      end

      private

      def translate_error_message(key, options)
        ::I18n.translate("#{BASE_KEY}.#{key}", options)
      end
    end
  end
end