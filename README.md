# Rancher::ManagementApi Gem

## Usage

1. Create a manager:

    a. If your Rancher has access control:
    ```ruby
    manager = Rancher::ManagementApi::Token.build_manager(
      host: "http://localhost:8080",
      username: "youruser",
      password: "yourpassword"
    )
    ```

    b. Or just create a manager:
    ```ruby
    manager = Rancher::ManagementApi::Manager.new(
      host: "http://localhost:8080",
    )
    ```
        
2. Create a project (known in the UI as an Environment):
    ```ruby
    project = manager.create_project("my environment name")
    ```

3. Create a new API key:
    ```ruby
    api_key = project.create_api_key("my api key name")
    ```

4. Save your api_key's secret:
    ```ruby
    puts "Your new RANCHER_ACCESS_KEY=#{api_key.publicValue}"
    puts "Your new RANCHER_SECRET_KEY=#{api_key.secretValue}"
    ```
