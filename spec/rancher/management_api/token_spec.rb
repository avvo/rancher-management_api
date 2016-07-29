require "spec_helper"

describe Rancher::ManagementApi::Token do
  let(:token) { "LGV5U6TuyEsJQC9J2CRHSLeVyMX5WYTAx8jGyicr" }
  let(:token_body) { <<-JSON
    {
      "id": null,
      "type": "token",
      "links": {},
      "actions": {},
      "accountId": "1a7",
      "authProvider": "localAuthConfig",
      "clientId": null,
      "code": null,
      "enabled": true,
      "hostname": null,
      "jwt": "#{token}",
      "scheme": null,
      "security": true,
      "user": "apiuser",
      "userIdentity": {
        "externalId": "1a7",
        "profilePicture": null,
        "name": "Api User",
        "externalIdType": "rancher_id",
        "profileUrl": null,
        "login": "apiuser",
        "role": null,
        "projectId": null,
        "all": null,
        "id": "rancher_id:1a7"
      },
      "userType": "user"
    }
  JSON
  }
  let!(:token_create) do
    WebMock.stub_request(:post, "#{host}/v1/token").
      with(
        body: '{"code":"apiuser:rancher"}'
    ).to_return(body: token_body, headers: {"Content-Type" => "application/json"})
  end
  let(:host) { "http://localhost:8080" }
  let(:conn) { Faraday.new(url: host) }

  describe ".create" do
    it "creates a token with the username and password" do
      described_class.create(code: "apiuser:rancher", conn: conn)
      expect(token_create).to have_been_made
    end
  end

  describe ".build_manager" do
    it "returns a manager" do
      expect(described_class.build_manager(host: host, username: "apiuser", password: "rancher")).
        to be_instance_of(Rancher::ManagementApi::Manager)
    end

    it "creates a token with the username and password" do
      described_class.build_manager(host: host, username: "apiuser", password: "rancher")
      expect(token_create).to have_been_made
    end
  end
end
