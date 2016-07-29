require "ostruct"

module Rancher
  module ManagementApi
    class Token < OpenStruct
      def self.create(code:, conn:)
        token_response = conn.post do |req|
          req.url "/v1/token"
          req.body = { code: code }.to_json
        end

        data = JSON.parse(token_response.body)

        new(data)
      end

      def self.build_manager(host:, username:, password:)
        conn = Rancher::ManagementApi.connection(host)

        token = create(code: [username, password].join(":"), conn: conn)

        tokened_conn = Rancher::ManagementApi.connection(host) do |faraday|
          faraday.headers["Cookie"] = "token=#{token.jwt}"
        end

        Manager.new(tokened_conn)
      end
    end
  end
end
