require "net/http"
require "uri"

module Picolib
  module Contact
    class API
      def initialize(end_point, access_token, debug=true)
        @end_point = end_point
        @access_token = access_token
        @debug = debug
      end

      def get_organization_list
        uri = URI(@end_point + '/organization/list')
        # uri = URI('http://test.u3dspace.com/uHutt/organization/list')
        req = Net::HTTP::Get.new(uri.path)
        req.add_field 'authorization', @access_token

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_contact_create(account_params)
        uri = URI(@end_point + '/contact/create')
        # uri = URI('http://test.u3dspace.com/uHutt/contact/create')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = account_params

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     params: #{account_params}"
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_organization_create(org_name)
        uri = URI(@end_point + '/organization/create')
        # uri = URI('http://test.u3dspace.com/uHutt/organization/create')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          organization: org_name
        }

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_organization_member_remove(u3d_user_id, u3d_org_id)
        uri = URI(@end_point + '/organization/member/remove')
        # uri = URI('http://test.u3dspace.com/uHutt/organization/member/remove')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          staff_id: u3d_user_id,
          organization_id: u3d_org_id
        }

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def get_organization_chart
        uri = URI(@end_point + '/organization/chart')
        req = Net::HTTP::Get.new(uri.path)
        req.add_field 'authorization', @access_token

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_organization_chart_set(u3d_org_id, chart)
        url = @end_point + '/organization/chart/set'
        res = HTTParty.post(url, {
            body: {
              organization_id: u3d_org_id,
              chart: chart.to_json
            },
            headers: {'authorization' => @access_token}
          }
        )
        if @debug
          puts "============ API: #{url} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_organization_tags_add(u3d_org_id, group_id)
        uri = URI(@end_point + '/organization/tags/add')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          organization_id: u3d_org_id,
          tag: group_id
        }

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_organization_tags_remove(u3d_org_id, group_id)
        uri = URI(@end_point + '/organization/tags/remove')
        req = Net::HTTP::Post.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          organization_id: u3d_org_id,
          tag: group_id
        }

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.request req
        end
        if @debug
          puts "============ API: #{uri} ==============="
          puts "     result: #{res.body}"
          puts "============ END ======================="
        end
        return res
      end

      def post_organization_tags_set(u3d_user_id, u3d_org_id, tags)
        url = @end_point + '/contact/tags/set'
        res = HTTParty.post(url, {
            body: {
              staff_id: u3d_user_id,
              organization_id: u3d_org_id,
              tags: tags.to_json
            },
            headers: {'authorization' => @access_token}
          }
        )
        if @debug
          puts "============ API: #{url}, params: #{u3d_user_id}, #{u3d_org_id}, #{tags} ==============="
          puts "     result: #{res.body}"
          puts "     result: #{res.response}"
          puts "============ END ======================="
        end
        return res
      end
    end
  end
end