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

      def post_account_suspend(u3d_user_id)
        uri = URI(@end_point + '/account/suspend')
        # uri = URI('http://test.u3dspace.com/uHutt/contact/create')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          staff_id: u3d_user_id
        }

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end

        if @debug
          puts "============ API: #{uri} ==============="
          puts "     u3d_user_id: #{u3d_user_id}"
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_account_unsuspend(u3d_user_id)
        uri = URI(@end_point + '/account/unsuspend')
        # uri = URI('http://test.u3dspace.com/uHutt/contact/create')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          staff_id: u3d_user_id
        }

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end

        if @debug
          puts "============ API: #{uri} ==============="
          puts "     u3d_user_id: #{u3d_user_id}"
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end
    end
  end
end