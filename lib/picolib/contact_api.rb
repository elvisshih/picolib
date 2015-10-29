module Picolib
  module Contact
    class API
      def initialize(end_point, access_token, debug=true)
        @end_point = end_point
        @access_token = access_token
        @debug = debug
      end

      def org_list_api
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

      def org_create_api(org_name)
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

      def org_remove_member_api(email, org_name)
        uri = URI(@end_point + '/organization/member/remove')
        # uri = URI('http://test.u3dspace.com/uHutt/organization/member/remove')
        req = Net::HTTP::Get.new(uri.path)
        req.add_field 'authorization', @access_token
        req.form_data = {
          email: email,
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

      def org_chart_set_api(u3d_org_id, chart)
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

      def org_chart_get_api
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

      def org_tags_add_api(u3d_org_id, group_id)
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

      def org_tags_remove_api(u3d_org_id, group_id)
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

      def org_tags_set_api(u3d_user_id, u3d_org_id, tags)
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

      def org_tags_list_api
        uri = URI(@end_point + '/organization/tags/list')
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
    end
  end
end