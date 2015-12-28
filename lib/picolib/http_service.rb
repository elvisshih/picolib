require "net/http"
require "uri"

module Picolib
  module HTTPService
    def self.request(path, args, verb, options = {})
      uri = URI(path)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        if verb == "post"
          req = Net::HTTP::Post.new(uri.path)
          # req.form_data = args[:params]
          req.body = args[:params].to_json
          req.content_type = 'application/json'
        else
          req = Net::HTTP::Get.new(uri.path)
        end
        req.add_field 'authorization', args[:access_token]

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
