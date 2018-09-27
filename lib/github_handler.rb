class GithubHandler
  require 'json'
  require 'octokit'

  USER = ''
  PASSWORD = ''

  @@client = Octokit::Client.new(:login => USER, :password => PASSWORD)

  def self.get_user_id(username)
    begin
      return @@client.user(username).id
    rescue
      raise "Unable to get name id in user GitHub: #{username}"
    end
  end

  def self.get_organizations_ids(username)
    begin
      organizations = []
      organizations_url = @@client.user(username)[:organizations_url]
      uri = URI(organizations_url)
      res = Net::HTTP.get_response(uri)
      JSON.parse(res.body).each do |v| 
        organizations << v["id"] 
      end
      return organizations
    rescue
      raise "Unable to get user's organizations in GitHub: #{username}"
    end
  end
end