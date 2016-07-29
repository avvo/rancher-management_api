require "spec_helper"
require_relative "../create_environment"

describe CreateEnvironment do
  let(:host) { "http://localhost:8080" }
  let(:name) { "mycoolinstance" }
  let(:username) { "apiuser" }
  let(:password) { "rancher" }
  subject { described_class.new(host, name, username: username, password: password) }

  describe "#call" do
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
          headers: {
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
          },
          body: '{"code":"apiuser:rancher"}'
      ).to_return(body: token_body, headers: {"Content-Type" => "application/json"})
    end
    let(:project_create_body) {
        {
          "swarm" => false,
          "kubernetes" => false,
          "mesos" => false,
          "virtualMachine" => false,
          "publicDns" => false,
          "type" => "project",
          "name" => "#{name}",
          "projectMembers" => [
            {
              "externalId" => "1a7",
              "externalIdType" => "rancher_id",
              "login" => "#{username}",
              "role" => "owner",
              "id" => "rancher_id:1a7",
              "type" => "identity"
            }
          ],
          "members" => [
            {
              "externalId" => "1a7",
              "externalIdType" => "rancher_id",
              "login" => "#{username}",
              "role" => "owner",
              "id" => "rancher_id:1a7",
              "type" => "identity"
            }
          ]
        }
    }
    let(:project_body) {
      <<-JSON
        {
          "id": "1a12",
          "type": "project",
          "links": {
            "self": "http://localhost:8080/v1/projects/1a12",
            "auditLogs": "http://localhost:8080/v1/projects/1a12/auditlogs",
            "backupTargets": "http://localhost:8080/v1/projects/1a12/backuptargets",
            "backups": "http://localhost:8080/v1/projects/1a12/backups",
            "certificates": "http://localhost:8080/v1/projects/1a12/certificates",
            "containerEvents": "http://localhost:8080/v1/projects/1a12/containerevents",
            "credentials": "http://localhost:8080/v1/projects/1a12/credentials",
            "environments": "http://localhost:8080/v1/projects/1a12/environments",
            "externalEvents": "http://localhost:8080/v1/projects/1a12/externalevents",
            "healthcheckInstanceHostMaps": "http://localhost:8080/v1/projects/1a12/healthcheckinstancehostmaps",
            "hosts": "http://localhost:8080/v1/projects/1a12/hosts",
            "images": "http://localhost:8080/v1/projects/1a12/images",
            "instanceLinks": "http://localhost:8080/v1/projects/1a12/instancelinks",
            "instances": "http://localhost:8080/v1/projects/1a12/instances",
            "ipAddresses": "http://localhost:8080/v1/projects/1a12/ipaddresses",
            "labels": "http://localhost:8080/v1/projects/1a12/labels",
            "mounts": "http://localhost:8080/v1/projects/1a12/mounts",
            "networks": "http://localhost:8080/v1/projects/1a12/networks",
            "physicalHosts": "http://localhost:8080/v1/projects/1a12/physicalhosts",
            "ports": "http://localhost:8080/v1/projects/1a12/ports",
            "projectMembers": "http://localhost:8080/v1/projects/1a12/projectmembers",
            "serviceConsumeMaps": "http://localhost:8080/v1/projects/1a12/serviceconsumemaps",
            "serviceEvents": "http://localhost:8080/v1/projects/1a12/serviceevents",
            "serviceExposeMaps": "http://localhost:8080/v1/projects/1a12/serviceexposemaps",
            "services": "http://localhost:8080/v1/projects/1a12/services",
            "snapshots": "http://localhost:8080/v1/projects/1a12/snapshots",
            "storagePools": "http://localhost:8080/v1/projects/1a12/storagepools",
            "userPreferences": "http://localhost:8080/v1/projects/1a12/userpreferences",
            "volumes": "http://localhost:8080/v1/projects/1a12/volumes",
            "accounts": "http://localhost:8080/v1/projects/1a12/accounts",
            "addOutputsInputs": "http://localhost:8080/v1/projects/1a12/addoutputsinputs",
            "amazonec2Configs": "http://localhost:8080/v1/projects/1a12/amazonec2configs",
            "apiKeys": "http://localhost:8080/v1/projects/1a12/apikeys",
            "azureConfigs": "http://localhost:8080/v1/projects/1a12/azureconfigs",
            "composeProjects": "http://localhost:8080/v1/projects/1a12/composeprojects",
            "composeServices": "http://localhost:8080/v1/projects/1a12/composeservices",
            "containerExecs": "http://localhost:8080/v1/projects/1a12/containerexecs",
            "containers": "http://localhost:8080/v1/projects/1a12/containers",
            "digitaloceanConfigs": "http://localhost:8080/v1/projects/1a12/digitaloceanconfigs",
            "dnsServices": "http://localhost:8080/v1/projects/1a12/dnsservices",
            "dockerBuilds": "http://localhost:8080/v1/projects/1a12/dockerbuilds",
            "environmentUpgrades": "http://localhost:8080/v1/projects/1a12/environmentupgrades",
            "externalDnsEvents": "http://localhost:8080/v1/projects/1a12/externaldnsevents",
            "externalHostEvents": "http://localhost:8080/v1/projects/1a12/externalhostevents",
            "externalServiceEvents": "http://localhost:8080/v1/projects/1a12/externalserviceevents",
            "externalServices": "http://localhost:8080/v1/projects/1a12/externalservices",
            "externalStoragePoolEvents": "http://localhost:8080/v1/projects/1a12/externalstoragepoolevents",
            "externalVolumeEvents": "http://localhost:8080/v1/projects/1a12/externalvolumeevents",
            "hostAccesses": "http://localhost:8080/v1/projects/1a12/hostaccesses",
            "identities": "http://localhost:8080/v1/projects/1a12/identities",
            "kubernetesServices": "http://localhost:8080/v1/projects/1a12/kubernetesservices",
            "loadBalancerConfigs": "http://localhost:8080/v1/projects/1a12/loadbalancerconfigs",
            "loadBalancerServices": "http://localhost:8080/v1/projects/1a12/loadbalancerservices",
            "machineDrivers": "http://localhost:8080/v1/projects/1a12/machinedrivers",
            "machines": "http://localhost:8080/v1/projects/1a12/machines",
            "packetConfigs": "http://localhost:8080/v1/projects/1a12/packetconfigs",
            "passwords": "http://localhost:8080/v1/projects/1a12/passwords",
            "projects": "http://localhost:8080/v1/projects/1a12/projects",
            "pullTasks": "http://localhost:8080/v1/projects/1a12/pulltasks",
            "register": "http://localhost:8080/v1/projects/1a12/register",
            "registrationTokens": "http://localhost:8080/v1/projects/1a12/registrationtokens",
            "registries": "http://localhost:8080/v1/projects/1a12/registries",
            "registryCredentials": "http://localhost:8080/v1/projects/1a12/registrycredentials",
            "scalePolicys": "http://localhost:8080/v1/projects/1a12/scalepolicys",
            "schemas": "http://localhost:8080/v1/projects/1a12/schemas",
            "serviceProxies": "http://localhost:8080/v1/projects/1a12/serviceproxies",
            "settings": "http://localhost:8080/v1/projects/1a12/settings",
            "snapshotBackupInputs": "http://localhost:8080/v1/projects/1a12/snapshotbackupinputs",
            "statsAccesses": "http://localhost:8080/v1/projects/1a12/statsaccesses",
            "typeDocumentations": "http://localhost:8080/v1/projects/1a12/typedocumentations",
            "virtualMachines": "http://localhost:8080/v1/projects/1a12/virtualmachines",
            "hostStats": "http://localhost:8080/v1/projects/1a12/projects/1a12/hoststats"
          },
          "actions": {},
          "name": "#{name}",
          "state": "registering",
          "created": "2016-07-29T18:08:23Z",
          "createdTS": 1469815703000,
          "description": null,
          "kind": "project",
          "kubernetes": false,
          "members": [
            {
              "externalId": "1a7",
              "externalIdType": "rancher_id",
              "role": "owner"
            }
          ],
          "mesos": false,
          "publicDns": false,
          "removed": null,
          "servicesPortRange": null,
          "swarm": false,
          "transitioning": "yes",
          "transitioningMessage": "In Progress",
          "transitioningProgress": null,
          "uuid": "db31b902-6d96-4669-bab3-749d4c5871cb",
          "virtualMachine": false
        }
      JSON
    }
    let!(:project_create) do
      WebMock.stub_request(:post, "#{host}/v1/project").
        with(
          headers: {
            'Cookie' => "token=#{token}",
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
          },
          body: project_create_body.to_json
      ).to_return(body: project_body, headers: {"Content-Type" => "application/json"})
    end

    let(:apikey_create_body) do
      {
        type: "apikey",
        accountId: "1a12",
        name: name,
      }
    end
    let(:apikey_body) do
      <<-JSON
      {
        "id": "1c6",
        "type": "apiKey",
        "links": {
          "self": "http://localhost:8080/v1/projects/1a12/apikeys/1c6",
          "account": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/account",
          "images": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/images",
          "instances": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/instances",
          "certificate": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/certificate"
        },
        "actions": {
          "activate": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/?action=activate",
          "remove": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/?action=remove",
          "deactivate": "http://localhost:8080/v1/projects/1a12/apikeys/1c6/?action=deactivate"
        },
        "name": "mycoolname",
        "state": "registering",
        "accountId": "1a12",
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
        with(
          headers: {
            'Cookie' => "token=#{token}",
            'Accept' => 'application/json',
            'Content-Type' => 'application/json',
          },
          body: apikey_create_body.to_json
      ).to_return(body: apikey_body, headers: {"Content-Type" => "application/json"})
    end

    it "creates a token with the username and password" do
      subject.call
      expect(token_create).to have_been_made
    end

    it "creates a project using the token returned" do
      subject.call
      expect(project_create).to have_been_made
    end

    it "creates a new api key for use in the new environment" do
      subject.call
      expect(apikey_create).to have_been_made
    end

    it "returns the env id, access key, and secret key" do
      expect(subject.call).to eq({
        env_id: "1a12",
        access_key: "375AD58E3AAF7191D3C0",
        secret_key: "aS2tSzVn6okWKUKGCFeg1hjp3vzxe2Y367v7uQqS",
      })
    end
  end
end
