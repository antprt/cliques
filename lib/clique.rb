module Clique
  def self.find_cliques(remaining_users, potential_clique=[], skip_users=[], cliques=[])
    #If the call to the function haven't possible users to extract cliques, this is a clique!
    if remaining_users.length == 0 && skip_users.length == 0
      cliques.push(potential_clique)
    end

    #Bucle to check relation between each user
    for user in remaining_users
      # Adding user to possible potential clique. We're going to check if there is relation between the users existing in remaining_users and the new user.
      new_potential_clique = potential_clique + [user]
      # Initialize new array to save the remaining users who have relation with the current user in the bucle
      new_remaining_users = []
      # Initialize new array to save the skip users who have relation with the current user in the bucle
      new_skip_list = []

      # Bucle to check if the remaining users have relation with the current user
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

      # We call again to the same function, but with the new values. This recursive call only maintains possibles new relations.
      find_cliques(new_remaining_users, new_potential_clique, new_skip_list, cliques)

      # We're done considering this user.  If the clique exists we already discovered in the recursive call. 
      #We remove it here from the list to continue check possible cliques with other users.
      remaining_users.delete(user)
      skip_users.push(user)
    end

    return cliques
  end

  #Receive a bidimensional array of users and return in alphabetical order. First internally each array and then the parent array.
  def self.order_cliques_alphabetically(users_cliques)
    users_cliques.each do |array|
      array.sort! {|x, y| x.name <=> y.name}
    end
    users_cliques.sort! {|x, y| x.first.name <=> y.first.name}
    return users_cliques
  end
end