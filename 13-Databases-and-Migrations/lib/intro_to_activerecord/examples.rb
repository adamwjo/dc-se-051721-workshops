class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides 
end

class Ride < ActiveRecord::Base
    belongs_to :driver
    belongs_to :passenger 
end 

class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :drivers, through: :rides 
end
