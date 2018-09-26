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
    puts "Leyendo fichero de entrada"
    file_content = FileHandlerInput.new.read_file
    usernames = TextHandler.new(file_content).parse_to_array_unique

    puts "Generando usuarios: "
    users = []
    usernames.each do |username|
      users << User.new(username)
      puts "Usuario #{username} generado"
    end
=begin
    puts "Conectando a Twitter y Github"
    users.each do |user|
      puts "Obteniendo información de Twitter y Github para el usuario #{user.name}"
      user.twitter_id = TwitterHandler.get_user_id(user.name)
      user.twitter_friends_ids = TwitterHandler.get_user_friends_ids(user.name)
      user.github_id = GithubHandler.get_user_id(user.name)
      user.github_organizations_ids = GithubHandler.get_organizations_ids(user.name)
    end
=end
    
    users[0].twitter_id = 4564353
    users[0].twitter_friends_ids = [55455, 77778]
    users[0].github_id = 888984
    users[0].github_organizations_ids = [985]

    users[1].twitter_id = 677676
    users[1].twitter_friends_ids = [4564353, 55455]
    users[1].github_id = 888984
    users[1].github_organizations_ids = [985]

    users[2].twitter_id = 55455
    users[2].twitter_friends_ids = [4564353, 77778, 677676]
    users[2].github_id = 888984
    users[2].github_organizations_ids = [985, 556, 8744]

    users[3].twitter_id = 77778
    users[3].twitter_friends_ids = [4564353, 55455]
    users[3].github_id = 888984
    users[3].github_organizations_ids = [985, 556]

    puts "Obteniendo usuarios completamente conectados y los cliques correspondientes. Esta operación puede tardar unos minutos."
    users_cliques = Clique::find_cliques(User.set_full_connected(users))

    puts "Generando fichero de salida"
    file_output = FileHandlerOutput.new
    file_output.write_file(Clique::order_cliques_alphabetically(users_cliques))
    puts "Fichero de salida generado"
  end 

  begin
    Main.main
  rescue Exception => e
    puts e.message
  end

end