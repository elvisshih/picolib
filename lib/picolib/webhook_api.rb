require "net/http"
require "uri"

module Picolib
  module Webhook
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

      def get_webhook_list
        path = @end_point + '/uHutt/webhook/list'

        result = Picolib.http_request(path, @args, "get", {debug: @debug})
      end

      def post_webhook_register(argument_params)
        path = @end_point + '/uHutt/webhook/register'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_client_update(argument_params)
        path = @end_point + '/uHutt/webhook/update'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_client_delete(argument_params)
        path = @end_point + '/uHutt/webhook/delete'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end