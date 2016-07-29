module Rancher
  module ManagementApi
    class Manager
      attr_reader :conn

      def initialize(conn)
        @conn = conn
      end

      def create_project(name)
        Project.create(conn, name)
      end
    end
  end
end
