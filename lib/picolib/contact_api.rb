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
        path = @end_point + '/uHutt/organization/list'
        args = {
          access_token: @access_token
        }

        result = Picolib.http_request(path, args, "get", {debug: @debug})
      end

      def post_contact_create(account_params)
        path = @end_point + '/uHutt/contact/create'
        args = {
          access_token: @access_token,
          params: account_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_contact_tags_members_set(account_params)
        path = @end_point + '/uHutt/contact/tags/members/set'
        args = {
          access_token: @access_token,
          params: account_params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_create(org_name)
        path = @end_point + '/uHutt/organization/create'
        args = {
          access_token: @access_token,
          params: {
            organization: org_name
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_member_remove(u3d_user_id, u3d_org_id)
        path = @end_point + '/uHutt/organization/member/remove'
        args = {
          access_token: @access_token,
          params: {
            staff_id: u3d_user_id,
            organization_id: u3d_org_id
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def get_organization_chart
        path = @end_point + '/uHutt/organization/chart'
        args = {
          access_token: @access_token
        }

        result = Picolib.http_request(path, args, "get", {debug: @debug})
      end

      def post_organization_chart_set(u3d_org_id, chart)
        path = @end_point + '/uHutt/organization/chart/set'
        args = {
          access_token: @access_token,
          params: {
            organization_id: u3d_org_id,
            chart: chart
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_tags_add(u3d_org_id, group_id)
        path = @end_point + '/uHutt/organization/tags/add'
        args = {
          access_token: @access_token,
          params: {
            organization_id: u3d_org_id,
            tag: group_id
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_tags_remove(u3d_org_id, group_id)
        path = @end_point + '/uHutt/organization/tags/remove'
        args = {
          access_token: @access_token,
          params: {
            organization_id: u3d_org_id,
            tag: group_id
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_tags_set(u3d_user_id, u3d_org_id, tags)
        path = @end_point + '/uHutt/contact/tags/set'
        args = {
          access_token: @access_token,
          params: {
            staff_id: u3d_user_id,
            organization_id: u3d_org_id,
            tags: tags
          }
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end
    end
  end
end