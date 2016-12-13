require "net/http"
require "uri"

module Picolib
  module OAuth2
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

      def post_oauth2_token(argument_params)
        path = @end_point + '/uAuth/oauth2/token'
        @args = {
          params: argument_params
        }

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end