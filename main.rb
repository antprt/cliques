#Execution thread of the program
class Main
  require_relative "user"
  require_relative "file_handler_input"
  require_relative "file_handler_output"
  require_relative "text_handler"
  require_relative "twitter_handler"
  require_relative "github_handler"
  require_relative "clique"

  begin
    puts "Leyendo fichero de entrada"
    file_content = FileHandlerInput.new.read_file
    usernames = TextHandler.new(file_content).parse_to_array_unique

    puts "Generando usuarios: "
    users = []
    usernames.each do |username|
      users << User.new(username)
      puts "Usuario #{username} generado"
    end

    puts "Conectando a Twitter y Github"
    users.each do |user|
      puts "Obteniendo información de Twitter y Github para el usuario #{user.name}"
      user.twitter_id = TwitterHandler.get_user_id(user.name)
      user.twitter_friends_ids = TwitterHandler.get_user_friends_ids(user.name)
      user.github_id = GithubHandler.get_user_id(user.name)
      user.github_organizations_ids = GithubHandler.get_organizations_ids(user.name)
    end
  
    puts "Obteniendo usuarios completamente conectados y los cliques correspondientes. Esta operación puede tardar unos minutos."
    users_cliques = Clique::find_cliques(User.set_full_connected(users))

    puts "Generando fichero de salida"
    file_output = FileHandlerOutput.new
    file_output.write_file(Clique::order_cliques_alphabetically(users_cliques))
    puts "Fichero de salida generado"
  rescue Exception => e
    puts e.message
  end

end