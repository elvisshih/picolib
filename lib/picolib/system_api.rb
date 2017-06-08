require "net/http"
require "uri"

module Picolib
  module System
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

      def post_system_online_set(argument_params)
        path = @end_point + '/uHutt/system/online/set'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end