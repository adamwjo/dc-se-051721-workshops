class Tweet 
  @@all = []

  def self.all
    @@all
  end

  attr_reader :message, :user
  def initialize(message, user)
    @message = message
    @user = user
    @@all << self
  end

  def username 
    user.username
  end

  def delete 
    Tweet.all.delete(self) 
  end

end