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

        if args[:headers]
          args[:headers].keys.each {|key| req.add_field key.to_s, args[:headers][key]}
        end

        # if args[:access_token]
        #   req.add_field 'authorization', args[:access_token]
        # end

        http.request req
      end

      if options[:debug]
        puts "============ API: #{uri} ==============="
        if args[:headers]
          puts "    headers: #{args[:headers].to_json}"
        end
        if args[:params]
          puts "     params: #{args[:params].to_json}"
        end
        if res.class == 'String'
          puts "     string result: #{res}"
        else
          puts "     result: #{res.body}"
        end
        puts "============ END ======================="
      end

      case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        jsonResult = JSON.parse res.body
        if not jsonResult["success"]
          if jsonResult["errorType"]
            options = jsonResult["message"] && {error: jsonResult["message"]} || {}
            jsonResult["errorMsg"] = Picolib.error_message(jsonResult["errorType"], options)
          elsif jsonResult["message"]
            jsonResult["errorMsg"] = Picolib.error_message('unexpectedError', {error: jsonResult["message"]})
          else
            jsonResult["errorMsg"] = Picolib.error_message('unexpectedError', {error: ""})
          end
        end
        return jsonResult
      else
        if res.class == 'String'
          return {"success"=> false, "errorMsg"=> res}
        else
          return {"success"=> false, "errorMsg"=> res.body}
        end
      end
    end
  end
end
