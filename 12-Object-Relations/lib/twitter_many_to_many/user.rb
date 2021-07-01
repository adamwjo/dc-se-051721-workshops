class User 
  @@all = []

  def self.all 
    @@all 
  end
  attr_reader :username
  def initialize(username)
    @username = username
    @@all << self
  end

  def post_tweet(message)
    Tweet.new(message, self)
  end

  def tweets
    Tweet.all.select { |tweet| tweet.user == self}
  end

end

  