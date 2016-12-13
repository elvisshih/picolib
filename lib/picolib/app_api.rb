require "net/http"
require "uri"

module Picolib
  module App
    class API
      def initialize(attributes)
        @end_point = attributes[:end_point]
        @headers = attributes[:headers]
        @debug = attributes[:debug]
        @sign = attributes[:sign]
        @user_id = attributes[:user_id]
        if @sign && @user_id
          @args = {
            headers: {
              sign: @sign,
              user_id: @user_id
            }
          }
        elsif @headers
          @args = {
            headers: @headers
          }
        else
          @args = {}
        end
      end

      def get_app_list
        path = @end_point + '/uHutt/app/list'

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_app_install(argument_params)
        path = @end_point + '/uHutt/app/install'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_app_uninstall(argument_params)
        path = @end_point + '/uHutt/app/uninstall'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end