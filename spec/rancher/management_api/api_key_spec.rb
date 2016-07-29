require "spec_helper"

describe Rancher::ManagementApi::ApiKey do
  let(:name) { "thename" }
  let(:project_id) { "1a7" }
  let(:apikey_create_body) do
    {
      accountId: project_id,
      name: name,
    }
  end
  let(:apikey_body) do
    <<-JSON
    {
      "id": "1c6",
      "type": "apiKey",
      "links": {
        "self": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6",
        "account": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/account",
        "images": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/images",
        "instances": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/instances",
        "certificate": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/certificate"
      },
      "actions": {
        "activate": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/?action=activate",
        "remove": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/?action=remove",
        "deactivate": "http://localhost:8080/v1/projects/#{project_id}/apikeys/1c6/?action=deactivate"
      },
      "name": "mycoolname",
      "state": "registering",
      "accountId": "#{project_id}",
      "created": "2016-07-29T18:22:37Z",
      "createdTS": 1469816557000,
      "description": "my cool description",
      "kind": "apiKey",
      "publicValue": "375AD58E3AAF7191D3C0",
      "removed": null,
      "secretValue": "aS2tSzVn6okWKUKGCFeg1hjp3vzxe2Y367v7uQqS",
      "transitioning": "yes",
      "transitioningMessage": "In Progress",
      "transitioningProgress": null,
      "uuid": "da6e0500-b2e9-4fa8-849e-0495b26e46bd"
    }
    JSON
  end
  let!(:apikey_create) do
    WebMock.stub_request(:post, "#{host}/v1/apikey").
      with( body: apikey_create_body.to_json).
      to_return(body: apikey_body,
                headers: {"Content-Type" => "application/json"})
  end

  let(:host) { "http://localhost:8080" }
  let(:conn) { Faraday.new(url: host) }
  let(:project) { double("Project", id: project_id, conn: conn) }

  describe ".create" do
    it "creates a new api key for use in the new environment" do
      described_class.create(project, name)
      expect(apikey_create).to have_been_made
    end
  end
end
