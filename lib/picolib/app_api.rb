require "net/http"
require "uri"

module Picolib
  module App
    class API
      def initialize(end_point, access_token=nil, debug=true)
        @end_point = end_point
        @access_token = access_token
        @debug = debug
      end

      def post_app_install(argument_params)
        path = @end_point + '/uHutt/app/install'
        args = {
          access_token: @access_token,
          params: argument_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug, content_type: 'json'})
      end

      def post_app_uninstall(argument_params)
        path = @end_point + '/uHutt/app/uninstall'
        args = {
          access_token: @access_token,
          params: argument_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end
    end
  end
end