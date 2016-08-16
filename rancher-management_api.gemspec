# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rancher/management_api/version'

Gem::Specification.new do |spec|
  spec.name          = "rancher-management_api"
  spec.version       = Rancher::ManagementApi::VERSION
  spec.authors       = ["Donald Plummer", ""]
  spec.email         = ["dplummer@avvo.com"]

  spec.summary       = %q{Client for creating environments and apikeys for Rancher}
  spec.description   = "#{spec.summary}."
  spec.homepage      = "https://github.com/dplummer/rancher-management_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["rancher-management"]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9.2"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "webmock", "~> 2.1"
end
