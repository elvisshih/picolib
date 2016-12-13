require "net/http"
require "uri"

module Picolib
  module Contact
    class API
      def initialize(attributes)
        @end_point = attributes[:end_point]
        @headers = attributes[:headers]
        @debug = attributes[:debug]
        @sign = attributes[:sign]
        @user_id = attributes[:user_id]
        if @sign && @user_id
          @args = {
            headers: {
              sign: @sign,
              user_id: @user_id
            }
          }
        elsif @headers
          @args = {
            headers: @headers
          }
        else
          @args = {}
        end
      end

      def get_organization_list
        path = @end_point + '/uHutt/organization/list'
        result = Picolib.http_request(path, @args, "get", {debug: @debug})
      end

      def post_contact_create(argument_params)
        path = @end_point + '/uHutt/contact/create'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_contact_tags_members_set(argument_params)
        path = @end_point + '/uHutt/contact/tags/members/set'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_organization_create(argument_params)
        path = @end_point + '/uHutt/organization/create'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_organization_member_remove(argument_params)
        path = @end_point + '/uHutt/organization/member/remove'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def get_organization_chart
        path = @end_point + '/uHutt/organization/chart'

        result = Picolib.http_request(path, @args, "get", {debug: @debug})
      end

      def post_organization_chart_set(argument_params)
        path = @end_point + '/uHutt/organization/chart/set'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_organization_tags_add(argument_params)
        path = @end_point + '/uHutt/organization/tags/add'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_organization_tags_remove(argument_params)
        path = @end_point + '/uHutt/organization/tags/remove'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end

      def post_organization_tags_set(argument_params)
        path = @end_point + '/uHutt/contact/tags/set'
        @args[:params] = argument_params

        result = Picolib.http_request(path, @args, "post", {debug: @debug})
      end
    end
  end
end