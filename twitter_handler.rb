class TwitterHandler
  require 'twitter'

  CONSUMER_KEY = "r6yA6qKHQHn0upxPjtw9aRrxF"#"gntMI92QJlpW3XF9zFMBwAjES"
  CONSUMER_SECRET = "4ohq9LamUFC4M2RGINVjYBMpktJQG57e1YmARuO3p04SmpcuW6"#"UOxpu59ltbAg8fvTKFmGOLXBuRwyaV0u5wEeTxowJFvnjSHLCK"
  CONSUMER_ACCESS_TOKEN = "419955282-9pwYgyB7Xj3d7eEYm3E0cSJUcjBNmpCQArN1ARYq" #"419955282-XCLOUl9uBqYFzYIW9KReH8FcVdtqFJ7P9cQtkhN9"
  CONSUMER_ACCESS_TOKEN_SECRET = "STyHM0BmBfd6GJEVyyieOu3E0EA0caQ7UMUN9tT2jhPOL" #"BThMbmV8E2F2VZssTFgeQZmTfxsJwufsxOzOz8L7XkYTn"

  @@client ||= Twitter::REST::Client.new do |config|
    config.consumer_key = CONSUMER_KEY
    config.consumer_secret = CONSUMER_SECRET
    config.access_token = CONSUMER_ACCESS_TOKEN
    config.access_token_secret = CONSUMER_ACCESS_TOKEN_SECRET
  end

  def self.get_user_id(username)
    begin
      return @@client.user(username).id
    rescue Exception => e
      raise "No se puede obtener id de nombre de usuario: #{username}. Message: #{e.message}"
    end
  end

  def self.get_user_friends_ids(username)
    begin
      return @@client.friends(username).to_a.map(&:id)
    rescue Exception => e
      raise "No se pueden obtener ids de amigos de usuario: #{username}. Message: #{e.message}"
    end
  end
end