require "net/http"
require "uri"

module Picolib
  module Client
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