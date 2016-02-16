class Deployer
  attr_reader :client, :repo
  HOLIDAYS = [Date.new(2016, 2, 15)]
  def initialize(repo)
    @client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
    @repo = repo
  end

  def post_todays_schedule
    today = Date.today.strftime('%B %d, %Y')
    unless weekend? || holiday?
      client.merge(repo, 'master', 'tomorrow', {commit_message: "Deployed Schedule for #{today}"})
      client.delete_branch(repo, 'tomorrow')
    end
  end

  private

  def weekend?
    Date.today.saturday? || Date.today.sunday?
  end

  def holiday?
    HOLIDAYS.include?(Date.today)
  end

end
