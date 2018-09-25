class TwitterHandler
  require 'twitter'

  CONSUMER_KEY = ""
  CONSUMER_SECRET = ""
  CONSUMER_ACCESS_TOKEN = ""
  CONSUMER_ACCESS_TOKEN_SECRET = ""

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