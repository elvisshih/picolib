require "net/http"
require "uri"

module Picolib
  module Account
    class API
      def initialize(end_point, access_token, debug=true)
        @end_point = end_point
        @access_token = access_token
        @debug = debug
      end

      def get_account_info
        path = @end_point + '/uHutt/account/info'
        args = {
          access_token: @access_token
        }

        result = Picolib.http_request(path, args, "get", {debug: @debug})
      end

      def post_account_suspend(u3d_user_id)
        path = @end_point + '/uHutt/account/suspend'
        args = {
          access_token: @access_token,
          params: {
            staff_id: u3d_user_id
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_account_unsuspend(u3d_user_id)
        path = @end_point + '/uHutt/account/unsuspend'
        args = {
          access_token: @access_token,
          params: {
            staff_id: u3d_user_id
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end
    end
  end
end