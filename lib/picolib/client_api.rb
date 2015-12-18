require "net/http"
require "uri"

module Picolib
  module Client
    class API
      def initialize(end_point, access_token=nil, debug=true)
        @end_point = end_point
        @access_token = access_token
        @debug = debug
      end

      def post_client_create(argument_params)
        path = @end_point + '/uHutt/client/create'
        args = {
          access_token: @access_token,
          params: argument_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_client_update(argument_params)
        path = @end_point + '/uHutt/client/update'
        args = {
          access_token: @access_token,
          params: argument_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_client_drop(argument_params)
        path = @end_point + '/uHutt/client/drop'
        args = {
          access_token: @access_token,
          params: argument_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end
    end
  end
end