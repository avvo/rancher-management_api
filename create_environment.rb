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
      req.body = {
        code: "#{username}:#{password}"
      }.to_json
    end

    data = JSON.parse(token_response.body)
    token = data.fetch("jwt")

    env_response = conn.post do |req|
      req.url "/v1/project"
      req.headers["Cookie"] = "token=#{token}"
      req.body = {
        name: name,
      }.to_json
    end

    env_id = JSON.parse(env_response.body).fetch("id")

    apikey_response = conn.post do |req|
      req.url "/v1/apikey"
      req.headers["Cookie"] = "token=#{token}"
      req.body = {
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
