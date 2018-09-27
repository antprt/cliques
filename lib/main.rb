#Execution thread of the program
class Main
  require_relative "user"
  require_relative "file_handler_input"
  require_relative "file_handler_output"
  require_relative "text_handler"
  require_relative "twitter_handler"
  require_relative "github_handler"
  require_relative "clique"

  def self.main
    puts "Reading input file"
    file_content = FileHandlerInput.new.read_file
    usernames = TextHandler.new(file_content).parse_to_array_unique

    puts "Generating users: "
    users = []
    usernames.each do |username|
      users << User.new(username)
      puts "User #{username} generate"
    end

    puts "Conecting to Twitter and Github"
    users.each do |user|
      puts "Getting information of Twitter and Github for the user #{user.name}. This operation can take a long time due to the restrictions of twitter requests."
      user.twitter_id = TwitterHandler.get_user_id(user.name)
      user.twitter_friends_ids = TwitterHandler.get_user_friends_ids(user.name)
      user.github_id = GithubHandler.get_user_id(user.name)
      user.github_organizations_ids = GithubHandler.get_organizations_ids(user.name)
    end

    puts "Getting full connected users and cliques. This operation can take a few minutes."
    users_cliques = Clique::find_cliques(User.set_full_connected(users))

    puts "Generating ouput file"
    file_output = FileHandlerOutput.new
    file_output.write_file(Clique::order_cliques_alphabetically(users_cliques))
    puts "Output file generated"
  end 

  begin
    Main.main
  rescue Exception => e
    puts e.message
  end

end