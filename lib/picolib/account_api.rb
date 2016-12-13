require "net/http"
require "uri"

module Picolib
  module Account
    class API
      def initialize(attributes)
        @end_point = attributes[:end_point]
        @access_token = attributes[:access_token]
        @debug = attributes[:debug]
        @sign = attributes[:sign]
        @user_id = attributes[:user_id]
        if @sign && @user_id
          @args = {
            header: {
              sign: @sign,
              user_id: @user_id
            }
          }
        elsif @access_token
          @args = {
            header: { authorization: @access_token }
          }
        else
          @args = {}
        end
      end

      def get_account_info
        path = @end_point + '/uHutt/account/info'
        result = Picolib.http_request(path, @args, "get", {debug: @debug})
      end

      def post_account_create(argument_params)
        path = @end_point + '/uHutt/account/create'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end      

      def post_account_active(argument_params)
        path = @end_point + '/uHutt/account/active'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end      

      def post_account_info_update(argument_params)
        path = @end_point + '/uHutt/account/info/update'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_account_suspend(argument_params)
        path = @end_point + '/uHutt/account/suspend'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_account_unsuspend(argument_params)
        path = @end_point + '/uHutt/account/unsuspend'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_account_verify_resend(argument_params)
        path = @end_point + '/uHutt/account/verifycode/resend'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end