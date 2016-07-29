require "ostruct"

module Rancher
  module ManagementApi
    class ApiKey < OpenStruct
      def self.create(project, name)
        apikey_response = project.conn.post do |req|
          req.url "/v1/apikey"
          req.body = {
            accountId: project.id,
            name: name,
          }.to_json
        end

        data = JSON.parse(apikey_response.body)
        new(data)
      end
    end
  end
end
