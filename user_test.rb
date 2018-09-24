require_relative 'user'
require 'test/unit'

class UserTest < Test::Unit::TestCase
  def test_creation 
    assert_equal "Nombre", User.new("Nombre").name
  end
end