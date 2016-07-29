require "faraday"

class CreateEnvironment
  attr_reader :host, :name, :username, :password

  def initialize(host, name, username:, password:)
    @host = host
    @name = name
    @username = username
    @password = password
  end

  def call
    conn = Faraday.new(url: host) do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.headers["Accept"] = "application/json"
      faraday.adapter  Faraday.default_adapter
    end

    token_response = conn.post do |req|
      req.url "/v1/token"
      req.body = {"code" => "#{username}:#{password}"}.to_json
    end

    data = JSON.parse(token_response.body)
    account_id = data.fetch("accountId")
    token = data.fetch("jwt")

    env_response = conn.post do |req|
      req.url "/v1/project"
      req.headers["Cookie"] = "token=#{token}"
      req.body = {
        "swarm" => false,
        "kubernetes" => false,
        "mesos" => false,
        "virtualMachine" => false,
        "publicDns" => false,
        "type" => "project",
        "name" => "#{name}",
        "projectMembers" => [
          {
            "externalId" => account_id,
            "externalIdType" => "rancher_id",
            "login" => "#{username}",
            "role" => "owner",
            "id" => "rancher_id:#{account_id}",
            "type" => "identity"
          }
        ],
        "members" => [
          {
            "externalId" => account_id,
            "externalIdType" => "rancher_id",
            "login" => "#{username}",
            "role" => "owner",
            "id" => "rancher_id:#{account_id}",
            "type" => "identity"
          }
        ]
      }.to_json
    end

    env_id = JSON.parse(env_response.body).fetch("id")

    apikey_response = conn.post do |req|
      req.url "/v1/apikey"
      req.headers["Cookie"] = "token=#{token}"
      req.body = {
        type: "apikey",
        accountId: env_id,
        name: name,
      }.to_json
    end

    apikey_data = JSON.parse(apikey_response.body)

    {
      env_id: env_id,
      access_key: apikey_data.fetch("publicValue"),
      secret_key: apikey_data.fetch("secretValue"),
    }
  end
end
