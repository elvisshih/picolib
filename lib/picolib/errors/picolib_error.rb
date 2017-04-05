module Picolib
  module Errors

    BASE_KEY = "picolib.errors.messages"

    def self.message(key, attributes = {})
      begin
        translate_error_message(key, attributes)
      rescue
        translate_error_message 'unexpectedError'
      end
    end

    def self.translate_error_message(key, options)
      I18n.t("#{BASE_KEY}.#{key}", options, default: "#{I18n.t("#{BASE_KEY}.unexpectedError", options)}")
    end
  end
end