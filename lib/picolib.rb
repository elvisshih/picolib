require "picolib/version"

# include picolib module
require "picolib/account_api"
require "picolib/app_api"
require "picolib/client_api"
require "picolib/contact_api"
require "picolib/oauth2_api"

# HTTP module
require "picolib/http_service"

module Picolib
  # Your code goes here...

  # An convenenient alias to Koala.http_service.make_request.
  def self.http_request(path, args, verb, options = {})
    HTTPService.request(path, args, verb, options)
  end
end
