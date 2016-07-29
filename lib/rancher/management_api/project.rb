require "ostruct"

module Rancher
  module ManagementApi
    class Project < OpenStruct
      def self.create(conn, name)
        env_response = conn.post do |req|
          req.url "/v1/project"
          req.body = {
            name: name,
          }.to_json
        end

        data = JSON.parse(env_response.body)

        new(conn, data)
      end

      attr_reader :conn

      def initialize(conn, data)
        @conn = conn
        super(data)
      end

      def create_api_key(name)
        ApiKey.create(self, name)
      end
    end
  end
end
