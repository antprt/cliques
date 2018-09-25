require_relative 'user'
require_relative 'clique'
require 'test/unit'

class CliqueTest < Test::Unit::TestCase
  def test_find_cliques_success
    user_a = User.new("A")
    user_b = User.new("B")
    user_c = User.new("C")
    user_d = User.new("D")

    user_a.full_connected_users = [user_b, user_c, user_d]
    user_b.full_connected_users = [user_a]
    user_c.full_connected_users = [user_a, user_d]
    user_d.full_connected_users = [user_a, user_c]

    cliques = Clique::find_cliques([user_a, user_b, user_c, user_d])

    assert_equal [ [user_a, user_b], [user_a, user_d, user_c] ], Clique::find_cliques([user_a, user_b, user_c, user_d])
  end

  def test_order_cliques_alphabetically_success
    user_a = User.new("zeta")
    user_b = User.new("equis")
    user_c = User.new("be_Nick")
    user_d = User.new("ernesto")
    user_e = User.new("antonio")

    users = [ [user_a, user_b, user_c], [user_d, user_e] ]

    assert_equal [[user_e, user_d], [user_c, user_b, user_a]], Clique::order_cliques_alphabetically(users)
  end

end