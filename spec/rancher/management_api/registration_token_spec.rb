require "spec_helper"

describe Rancher::ManagementApi::RegistrationToken do
  let(:token_body) {
    <<-JSON
      {
        "id": "1c6",
        "type": "registrationToken",
        "links": {
          "self": "http://localhost:8080/v1/registrationtokens/1c6",
          "account": "http://localhost:8080/v1/registrationtokens/1c6/account",
          "images": "http://localhost:8080/v1/registrationtokens/1c6/images",
          "instances": "http://localhost:8080/v1/registrationtokens/1c6/instances"
        },
        "actions": {
          "activate": "http://localhost:8080/v1/registrationtokens/1c6/?action=activate",
          "remove": "http://localhost:8080/v1/registrationtokens/1c6/?action=remove",
          "deactivate": "http://localhost:8080/v1/registrationtokens/1c6/?action=deactivate"
        },
        "name": null,
        "state": "registering",
        "accountId": "1a10",
        "command": null,
        "created": "2016-08-03T00:12:28Z",
        "createdTS": 1470183148000,
        "description": null,
        "image": null,
        "kind": "registrationToken",
        "registrationUrl": null,
        "removed": null,
        "token": null,
        "transitioning": "yes",
        "transitioningMessage": "In Progress",
        "transitioningProgress": null,
        "uuid": "7cc48878-b478-4514-a4c5-f618076a8752"
      }
    JSON
  }
  let(:token_body_active) {
    <<-JSON
      {
        "id": "1c6",
        "type": "registrationToken",
        "links": {
          "self": "http://localhost:8080/v1/projects/1a10/registrationtokens/1c6",
          "account": "http://localhost:8080/v1/projects/1a10/registrationtokens/1c6/account",
          "images": "http://localhost:8080/v1/projects/1a10/registrationtokens/1c6/images",
          "instances": "http://localhost:8080/v1/projects/1a10/registrationtokens/1c6/instances",
          "registrationUrl": "http://localhost:8080/v1/scripts/2ED6B1025AB7272CFCB2:1470182400000:Yi3WZdE2Es5oE8SLTGsMNUxGq0"
        },
        "actions": {
          "update": "http://localhost:8080/v1/projects/1a10/registrationtokens/1c6/?action=update",
          "deactivate": "http://localhost:8080/v1/projects/1a10/registrationtokens/1c6/?action=deactivate"
        },
        "name": null,
        "state": "active",
        "accountId": "1a10",
        "command": "sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.2 http://localhost:8080/v1/scripts/2ED6B1025AB7272CFCB2:1470182400000:Yi3WZdE2Es5oE8SLTGsMNUxGq0",
        "created": "2016-08-02T17:38:09Z",
        "createdTS": 1470159489000,
        "description": null,
        "image": "rancher/agent:v1.0.2",
        "kind": "registrationToken",
        "registrationUrl": "http://localhost:8080/v1/scripts/2ED6B1025AB7272CFCB2:1470182400000:Yi3WZdE2Es5oE8SLTGsMNUxGq0",
        "removed": null,
        "token": "2ED6B1025AB7272CFCB2:1470182400000:Yi3WZdE2Es5oE8SLTGsMNUxGq0",
        "transitioning": "no",
        "transitioningMessage": null,
        "transitioningProgress": null,
        "uuid": "e92641b5-808f-4e99-a120-38e8014aa02a"
      }
    JSON
  }

  let(:host) { "http://localhost:8080" }
  let(:conn) { Faraday.new(url: host) }
  let(:project) { OpenStruct.new(conn: conn, id: "1a10") }

  let!(:token_create) do
    WebMock.stub_request(:post, "#{host}/v1/registrationtokens?projectId=1a10").
      to_return(body: token_body, headers: {"Content-Type" => "application/json"})
  end
  let!(:token_check) do
    WebMock.stub_request(:get, "#{host}/v1/registrationtokens/1c6").
      to_return(body: token_body_active, headers: {"Content-Type" => "application/json"})
  end

  describe ".create" do
    it "creates a  using the token returned" do
      described_class.create(project)
      expect(token_create).to have_been_made
      expect(token_check).to have_been_made
    end
  end
end
