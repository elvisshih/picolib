require "net/http"
require "uri"
require "openssl"

module Picolib
  module HTTPService
    def self.request(path, args, verb, options = {})
      uri = URI(path)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        if verb == "post"
          req = Net::HTTP::Post.new(uri.path)
          # req.form_data = args[:params]
          if args[:params]
            req.body = args[:params].to_json
            req.content_type = 'application/json'
          end
        else
          req = Net::HTTP::Get.new(uri.path)
        end

        if args[:sign] && args[:user_id]
          req.add_field 'sign', args[:sign]
          req.add_field 'user-id', args[:user_id] 
        elsif args[:access_token]
          req.add_field 'authorization', args[:access_token]
        end

        http.request req
      end

      if options[:debug]
        puts "============ API: #{uri} ==============="
        if args[:params]
          puts "     params: #{args[:params].to_json}"
        end
        puts "     result: #{res.body}"
        puts "============ END ======================="
      end
      return res
    end
  end
end
