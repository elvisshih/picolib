require "net/http"
require "uri"

module Picolib
  module Account
    class API
      def initialize(end_point, headers=nil, opts={})
        @end_point = end_point
        @debug = opts[:debug]
        
        if headers.class == String
          @args = {headers: {authorization: headers}}  
        elsif headers.class == Hash 
          @args = {headers: headers}
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