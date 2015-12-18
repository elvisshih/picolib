require "net/http"
require "uri"

module Picolib
  module OAuth2
    class API
      def initialize(end_point, access_token=nil, debug=true)
        @end_point = end_point
        @access_token = access_token
        @debug = debug
      end

      def post_oauth2_token(argument_params)
        path = @end_point + '/uAuth/oauth2/token'
        args = {
          params: argument_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end
    end
  end
end