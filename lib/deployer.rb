require_relative '../config/environment'

class Deployer
  attr_reader :client, :repo

  def initialize(repo)
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
    @repo = repo
  end

  def post_todays_schedule
    today = Date.today.strftime('%B %d, %Y')
    client.merge(repo, 'master', 'tomorrow', {commit_message: "Deployed Schedule for #{today}"})
  end

end
