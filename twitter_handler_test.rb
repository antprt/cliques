require_relative 'twitter_handler'
require 'test/unit'

#Note: It can be interesting make this test independent of the network.
class TwitterHandlerTest < Test::Unit::TestCase

  def test_get_user_id_fail
    assert_raise RuntimeError do TwitterHandler.get_user_id('') end    
  end

  def test_get_user_id_success
    assert_equal Fixnum, TwitterHandler.get_user_id('policia').class
  end
  
  def test_get_twitter_friends_ids_fail
    assert_raise RuntimeError do TwitterHandler.get_user_friends_ids('') end    
  end

  def test_get_twitter_friends_ids_success
    #Return fixnum like array content
    assert_equal [Fixnum], TwitterHandler.get_user_friends_ids('policia').map(&:class).uniq
  end
end