require "ostruct"
require "json"

module Rancher
  module ManagementApi
    class RegistrationToken < OpenStruct
      def self.create(project)
        response = project.conn.post do |req|
          req.url "/v1/registrationtokens?projectId=#{project.id}"
        end

        data = JSON.parse(response.body)

        # reload until the project is ready
        while data["state"] == "registering"
          sleep 0.5
          url = data["links"]["self"]
          response = project.conn.get do |req|
            req.url url
          end

          data = JSON.parse(response.body)
        end
        new(data)
      end

    end
  end
end
