require "picolib/version"

# include picolib module
require "picolib/account_api"
require "picolib/app_api"
require "picolib/client_api"
require "picolib/contact_api"
require "picolib/oauth2_api"
require "picolib/pico_sign"
require "picolib/errors/picolib_error"
require "picolib/system_api"
require "picolib/webhook_api"

# HTTP module
require "picolib/http_service"

# add english load path by default
I18n.load_path << File.join(File.dirname(__FILE__), "config", "locales", "en.yml")

module Picolib
  # Your code goes here...

  # An convenenient alias to Koala.http_service.make_request.
  def self.http_request(path, args, verb, options = {})
    HTTPService.request(path, args, verb, options)
  end

  def self.decode_pico_sign(pico_sign, client_secret)
  	PicoSign.decode_signed_request(pico_sign, client_secret)
  end

  def self.encode_pico_sign(payload, client_secret)
  	PicoSign.encode_signed_request(payload, client_secret)
  end

  def self.error_message(key, attributes = {})
    Errors.message(key, attributes)
  end
end
