class User
  attr_accessor :name, :twitter_id, :twitter_friends_ids, :github_id, :github_organizations_ids, :full_connected_users

  def initialize(name)
    @name = name
    @twitter_friends_ids = []
    @github_organizations_ids = []
    @full_connected_users = []
  end

  def self.find_by_twitter_id(twitter_id, users)
    user_find = nil
    users.each do |user|
      if user.twitter_id == twitter_id
        user_find = user
        break
      end
    end
    return user_find
  end

  def self.set_full_connected(users)
    users.each do |user|
      user.twitter_friends_ids.each do |twitter_id|
        user_friend = User.find_by_twitter_id(twitter_id, users)
        unless user_friend.nil?
          if user_friend.twitter_friends_ids.include?(user.twitter_id) && (user_friend.github_organizations_ids & user.github_organizations_ids).any?
            user.full_connected_users.push(user_friend)
          end 
        end
      end
    end
  end
end