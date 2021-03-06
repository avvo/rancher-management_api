require "rancher/management_api/version"
require "faraday"

module Rancher
  module ManagementApi
    def self.connection(host = nil)
      Faraday.new(url: host || ENV["RANCHER_URL"]) do |faraday|
        faraday.headers["Content-Type"] = "application/json"
        faraday.headers["Accept"] = "application/json"
        faraday.adapter Faraday.default_adapter
        yield(faraday) if block_given?
      end
    end
  end
end

require "rancher/management_api/manager"
require "rancher/management_api/api_key"
require "rancher/management_api/project"
require "rancher/management_api/token"
require "rancher/management_api/registration_token"
