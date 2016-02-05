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

      def post_contact_create(params)
        path = @end_point + '/uHutt/contact/create'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_contact_tags_members_set(params)
        path = @end_point + '/uHutt/contact/tags/members/set'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_create(params)
        path = @end_point + '/uHutt/organization/create'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_member_remove(params)
        path = @end_point + '/uHutt/organization/member/remove'
        args = {
          access_token: @access_token,
          params: params
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

      def post_organization_chart_set(params)
        path = @end_point + '/uHutt/organization/chart/set'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_tags_add(params)
        path = @end_point + '/uHutt/organization/tags/add'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_tags_remove(params)
        path = @end_point + '/uHutt/organization/tags/remove'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end

      def post_organization_tags_set(params)
        path = @end_point + '/uHutt/contact/tags/set'
        args = {
          access_token: @access_token,
          params: params
        }

        result = Picolib.http_request(path, args, "post", {debug: @debug})
      end
    end
  end
end