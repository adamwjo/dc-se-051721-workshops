class Like 
  @@all = []
  def self.all 
    @@all 
  end

  def initialize(tweet, user)
    @tweet = tweet 
    @user = user
    @@all << self
  end
end