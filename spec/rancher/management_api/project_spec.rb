require "spec_helper"

describe Rancher::ManagementApi::Project do
  let(:name) { "testname" }

  let(:project_create_body) {
    {
      name: name
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

  let(:host) { "http://localhost:8080" }
  let(:conn) { Faraday.new(url: host) }

  let!(:project_create) do
    WebMock.stub_request(:post, "#{host}/v1/project").
      with(
        body: project_create_body.to_json
    ).to_return(body: project_body, headers: {"Content-Type" => "application/json"})
  end

  describe ".create" do
    it "creates a project using the token returned" do
      described_class.create(conn, name)
      expect(project_create).to have_been_made
    end
  end
end
