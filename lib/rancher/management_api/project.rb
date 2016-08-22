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

        # reload until the project is ready
        while data["state"] == "registering"
          sleep 0.5
          url = data["links"]["self"]
          response = conn.get do |req|
            req.url url
          end

          data = JSON.parse(response.body)
        end

        new(conn, data)
      end

      def self.find_by_name(conn, name)
        response = conn.get "/v1/projects"
        if data = JSON.parse(response.body)["data"].detect {|proj| proj["name"] == name}
          new(conn, data)
        else
          nil
        end
      end

      attr_reader :conn

      def initialize(conn, data)
        @conn = conn
        super(data)
      end

      def create_api_key(name)
        ApiKey.create(self, name)
      end

      def create_registration_token
        RegistrationToken.create(self)
      end
    end
  end
end
