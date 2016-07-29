require 'spec_helper'

describe Rancher::ManagementApi do
  it 'has a version number' do
    expect(Rancher::ManagementApi::VERSION).not_to be nil
  end
end
