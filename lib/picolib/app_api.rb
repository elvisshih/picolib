require "net/http"
require "uri"

module Picolib
  module App
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