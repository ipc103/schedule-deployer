require_relative 'spec_helper'

describe Deployer do

  let(:deployer) {Deployer.new('ipc103/test-schedule')}
  describe '#new' do
    it 'should initialize with a repo location' do
      expect(deployer.repo).to eq('ipc103/test-schedule')
    end

    it 'should have an Octokit client' do
      expect(deployer.client).to be_kind_of(Octokit::Client)
    end

  end

  describe '#client' do

    it 'can find associated repo information from the repo name' do
      repository = 'ipc103/test-schedule'
      expect {deployer.client.repo(repository)}.to_not raise_error
    end

    it 'has a merge method' do
      expect(deployer.client.methods).to include(:merge)
    end

    it 'can delete a branch' do
      expect(deployer.client.methods).to include(:delete_branch)
    end

  end
end
