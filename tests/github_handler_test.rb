require_relative File.expand_path("../lib/github_handler.rb")
require 'test/unit'

#Note: It can be interesting make this test independent of the network.
class GithubHandlerTest < Test::Unit::TestCase

  def test_get_user_id_fail
    assert_raise RuntimeError do GithubHandler.get_user_id('') end    
  end

  def test_get_user_id_success
    assert_equal Fixnum, GithubHandler.get_user_id('andrew').class
  end
  
  def test_get_organizations_ids_fail
    assert_raise RuntimeError do GithubHandler.get_organizations_ids('') end    
  end

  def test_get_organizations_ids_success
    #Return fixnum like array content
    assert_equal [Fixnum], GithubHandler.get_organizations_ids('andrew').map(&:class).uniq
  end
end