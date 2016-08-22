module Rancher
  module ManagementApi
    class Manager
      attr_reader :conn

      def initialize(conn = nil, host: nil)
        @conn = conn || ManagementApi.connection(host)
      end

      def create_project(name)
        Project.create(conn, name)
      end

      def find_project_by_name(name)
        Project.find_by_name(conn, name)
      end
    end
  end
end
