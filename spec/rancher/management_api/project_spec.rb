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
  let(:project_body_active) {
    <<-JSON
      {
        "id": "1a12",
        "type": "project",
        "links": {
          "self": "http://localhost:8080/v1/projects/1a12",
          "agents": "http://localhost:8080/v1/projects/1a12/agents",
          "auditLogs": "http://localhost:8080/v1/projects/1a12/auditlogs",
          "backupTargets": "http://localhost:8080/v1/projects/1a12/backuptargets",
          "backups": "http://localhost:8080/v1/projects/1a12/backups",
          "certificates": "http://localhost:8080/v1/projects/1a12/certificates",
          "configItemStatuses": "http://localhost:8080/v1/projects/1a12/configitemstatuses",
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
          "azureadconfigs": "http://localhost:8080/v1/projects/1a12/azureadconfigs",
          "composeProjects": "http://localhost:8080/v1/projects/1a12/composeprojects",
          "composeServices": "http://localhost:8080/v1/projects/1a12/composeservices",
          "configItems": "http://localhost:8080/v1/projects/1a12/configitems",
          "containerExecs": "http://localhost:8080/v1/projects/1a12/containerexecs",
          "containers": "http://localhost:8080/v1/projects/1a12/containers",
          "databasechangeloglocks": "http://localhost:8080/v1/projects/1a12/databasechangeloglocks",
          "databasechangelogs": "http://localhost:8080/v1/projects/1a12/databasechangelogs",
          "digitaloceanConfigs": "http://localhost:8080/v1/projects/1a12/digitaloceanconfigs",
          "dnsServices": "http://localhost:8080/v1/projects/1a12/dnsservices",
          "dockerBuilds": "http://localhost:8080/v1/projects/1a12/dockerbuilds",
          "environmentUpgrades": "http://localhost:8080/v1/projects/1a12/environmentupgrades",
          "extensionPoints": "http://localhost:8080/v1/projects/1a12/extensionpoints",
          "externalDnsEvents": "http://localhost:8080/v1/projects/1a12/externaldnsevents",
          "externalHandlerExternalHandlerProcessMaps": "http://localhost:8080/v1/projects/1a12/externalhandlerexternalhandlerprocessmaps",
          "externalHandlerProcesses": "http://localhost:8080/v1/projects/1a12/externalhandlerprocesses",
          "externalHandlers": "http://localhost:8080/v1/projects/1a12/externalhandlers",
          "externalHostEvents": "http://localhost:8080/v1/projects/1a12/externalhostevents",
          "externalServiceEvents": "http://localhost:8080/v1/projects/1a12/externalserviceevents",
          "externalServices": "http://localhost:8080/v1/projects/1a12/externalservices",
          "externalStoragePoolEvents": "http://localhost:8080/v1/projects/1a12/externalstoragepoolevents",
          "externalVolumeEvents": "http://localhost:8080/v1/projects/1a12/externalvolumeevents",
          "githubconfigs": "http://localhost:8080/v1/projects/1a12/githubconfigs",
          "haConfigInputs": "http://localhost:8080/v1/projects/1a12/haconfiginputs",
          "haConfigs": "http://localhost:8080/v1/projects/1a12/haconfigs",
          "hostAccesses": "http://localhost:8080/v1/projects/1a12/hostaccesses",
          "hostApiProxyTokens": "http://localhost:8080/v1/projects/1a12/hostapiproxytokens",
          "identities": "http://localhost:8080/v1/projects/1a12/identities",
          "kubernetesServices": "http://localhost:8080/v1/projects/1a12/kubernetesservices",
          "ldapconfigs": "http://localhost:8080/v1/projects/1a12/ldapconfigs",
          "loadBalancerConfigs": "http://localhost:8080/v1/projects/1a12/loadbalancerconfigs",
          "loadBalancerServices": "http://localhost:8080/v1/projects/1a12/loadbalancerservices",
          "localAuthConfigs": "http://localhost:8080/v1/projects/1a12/localauthconfigs",
          "machineDrivers": "http://localhost:8080/v1/projects/1a12/machinedrivers",
          "machines": "http://localhost:8080/v1/projects/1a12/machines",
          "openldapconfigs": "http://localhost:8080/v1/projects/1a12/openldapconfigs",
          "packetConfigs": "http://localhost:8080/v1/projects/1a12/packetconfigs",
          "passwords": "http://localhost:8080/v1/projects/1a12/passwords",
          "processDefinitions": "http://localhost:8080/v1/projects/1a12/processdefinitions",
          "processExecutions": "http://localhost:8080/v1/projects/1a12/processexecutions",
          "processInstances": "http://localhost:8080/v1/projects/1a12/processinstances",
          "projects": "http://localhost:8080/v1/projects/1a12/projects",
          "pullTasks": "http://localhost:8080/v1/projects/1a12/pulltasks",
          "register": "http://localhost:8080/v1/projects/1a12/register",
          "registrationTokens": "http://localhost:8080/v1/projects/1a12/registrationtokens",
          "registries": "http://localhost:8080/v1/projects/1a12/registries",
          "registryCredentials": "http://localhost:8080/v1/projects/1a12/registrycredentials",
          "resourceDefinitions": "http://localhost:8080/v1/projects/1a12/resourcedefinitions",
          "scalePolicys": "http://localhost:8080/v1/projects/1a12/scalepolicys",
          "schemas": "http://localhost:8080/v1/projects/1a12/schemas",
          "serviceProxies": "http://localhost:8080/v1/projects/1a12/serviceproxies",
          "settings": "http://localhost:8080/v1/projects/1a12/settings",
          "snapshotBackupInputs": "http://localhost:8080/v1/projects/1a12/snapshotbackupinputs",
          "statsAccesses": "http://localhost:8080/v1/projects/1a12/statsaccesses",
          "taskInstances": "http://localhost:8080/v1/projects/1a12/taskinstances",
          "tasks": "http://localhost:8080/v1/projects/1a12/tasks",
          "typeDocumentations": "http://localhost:8080/v1/projects/1a12/typedocumentations",
          "virtualMachines": "http://localhost:8080/v1/projects/1a12/virtualmachines",
          "hostStats": "http://localhost:8080/v1/projects/1a12/projects/1a12/hoststats"
        },
        "actions": {
          "update": "http://localhost:8080/v1/projects/1a12/?action=update",
          "deactivate": "http://localhost:8080/v1/projects/1a12/?action=deactivate",
          "setmembers": "http://localhost:8080/v1/projects/1a12/?action=setmembers",
          "delete": "http://localhost:8080/v1/projects/1a12/?action=delete"
        },
        "name": "test1",
        "state": "active",
        "allowSystemRole": false,
        "created": "2016-08-02T17:25:27Z",
        "createdTS": 1470158727000,
        "data": {
          "fields": {
            "publicDns": false,
            "mesos": false,
            "virtualMachine": false,
            "allowSystemRole": false,
            "kubernetes": false,
            "swarm": false,
            "defaultNetworkId": 25,
            "servicesPortRange": {
              "startPort": 49153,
              "endPort": 65535
            }
          }
        },
        "description": null,
        "kind": "project",
        "kubernetes": false,
        "members": null,
        "mesos": false,
        "publicDns": false,
        "removeTime": null,
        "removed": null,
        "servicesPortRange": {
          "endPort": 65535,
          "startPort": 49153
        },
        "swarm": false,
        "transitioning": "no",
        "transitioningMessage": null,
        "transitioningProgress": null,
        "uuid": "4d7f4140-0fd9-4af9-b264-5dea90e819fb",
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
  let!(:project_check) do
    WebMock.stub_request(:get, "#{host}/v1/projects/1a12").
      to_return(body: project_body_active, headers: {"Content-Type" => "application/json"})
  end

  describe ".create" do
    it "creates a project using the token returned" do
      described_class.create(conn, name)
      expect(project_create).to have_been_made
      expect(project_check).to have_been_made
    end
  end
end
