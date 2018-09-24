class User
  attr_accessor :name, :twitter_id, :twitter_friends_ids, :github_id, :github_organizations_ids

  def initialize(name)
    @name = name
    @twitter_friends_ids = []
    @github_organizations_ids = []
  end
end