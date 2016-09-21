require "net/http"
require "uri"

module Picolib
  module Client
    class API
      def initialize(attributes)
        @end_point = attributes[:end_point]
        @access_token = attributes[:access_token]
        @debug = attributes[:debug]
        @sign = attributes[:sign]
        @user_id = attributes[:user_id]
        if @sign && @user_id
          @args = {
            sign: @sign,
            user_id: @user_id
          }
        elsif @access_token
          @args = {
            access_token: @access_token
          }
        end
      end

      def post_client_create(argument_params)
        path = @end_point + '/uHutt/client/create'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_client_update(argument_params)
        path = @end_point + '/uHutt/client/update'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_client_drop(argument_params)
        path = @end_point + '/uHutt/client/drop'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_client_grant_token(argument_params)
        path = @end_point + '/uHutt/client/grant'

        @args = {
          params: argument_params
        }

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end