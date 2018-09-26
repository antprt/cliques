module Clique
  def self.find_cliques(remaining_users, potential_clique=[], skip_users=[], cliques=[])
    if remaining_users.length == 0 && skip_users.length == 0
      cliques.push(potential_clique)
    end

    for user in remaining_users
      # Try adding the user to the current potential_clique to see if we can make it work.
      new_potential_clique = potential_clique + [user]
      new_remaining_users = []
      new_skip_list = []

      for u in remaining_users
        if user.full_connected_users.include?(u)
          new_remaining_users.push(u)
        end
      end

      for u in skip_users
        if user.full_connected_users.include?(u)
          new_skip_list.push(u)
        end
      end

      find_cliques(new_remaining_users, new_potential_clique, new_skip_list, cliques)

      # We're done considering this user.  If there was a way to form a clique with it, we
      # already discovered its maximal clique in the recursive call above.  So, go ahead
      # and remove it from the list of remaining users and add it to the skip list.
      remaining_users.delete(user)
      skip_users.push(user)
    end

    return cliques
  end

  def self.order_cliques_alphabetically(users_cliques)
    users_cliques.each do |array|
      array.sort! {|x, y| x.name <=> y.name}
    end
    users_cliques.sort! {|x, y| x.first.name <=> y.first.name}
    return users_cliques
  end
end