require_relative File.expand_path("../lib/user.rb")
require 'test/unit'

class UserTest < Test::Unit::TestCase
  def test_creation 
    assert_equal "Nombre", User.new("Nombre").name
  end

  def test_find_by_twitter_id_found
    users = set_array_of_users
    assert_equal users[2], User.find_by_twitter_id(2, users)
  end

  def test_find_by_twitter_id_not_found
    users = set_array_of_users
    assert_equal nil, User.find_by_twitter_id(3, users)
  end

  def test_set_full_connected
    users = set_array_of_users
    User.set_full_connected(users)
    puts users[0].full_connected_users
    puts users[2].full_connected_users
    assert_equal [users[2]], users[0].full_connected_users
  end

  private
  def set_array_of_users
    users = [User.new("A"), User.new("B"), User.new("C")]
    users[0].twitter_id = 0
    users[0].github_id = 10
    users[0].github_organizations_ids = [30, 70, 80]
    users[0].twitter_friends_ids = [2, 67]

    users[1].twitter_id = 1
    users[1].github_id = 20
    users[1].github_organizations_ids = []
    users[1].twitter_friends_ids = [100, 500, 600]

    users[2].twitter_id = 2
    users[2].github_id = 30
    users[2].github_organizations_ids = [30, 1000]
    users[2].twitter_friends_ids = [0, 6500]

    return users
  end
end