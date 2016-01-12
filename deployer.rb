require 'bundler'
Bundler.require
Dotenv.load

class Deployer
  attr_reader :client, :repo

  def initialize
    @client = Octokit::Client.new(:access_token => ENV['access_token'])
    @repo = 'ipc103/test-schedule'
  end

  def post_todays_schedule
    today = Date.today.strftime('%B %d, %Y')
    client.merge(repo, 'master', 'tomorrow', {commit_message: "Deployed Schedule for #{today}"})
  end

end
