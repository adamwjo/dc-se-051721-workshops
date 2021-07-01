class Driver
    def initialize(attributes)
        @name = attributes[:name]
    end
    def rides
        Ride.all.select { |ride| ride.driver == self } 
    end
end
class Ride
    @@all = []
    attr_reader :driver, :length, :passenger
    def initialize(attributes)
       @driver = attributes[:driver]
       @passenger = attributes[:passenger]
       @length = attributes[:length]
       @@all << self 
    end
    def self.all
        @@all
    end
end
class Passenger
    def initialize(attributes)
        @name = attributes[:name]
    end
    def rides
        Ride.all.select { |ride| ride.passenger == self } 
    end
    def drivers
        rides.map{ |ride| ride.driver }.flatten
    end
end

driver1 = Driver.new({"name": "Adam"})
driver2 = Driver.new({"name": "Chicken"})
driver3 = Driver.new({"name": "Cool"})

passenger1 = Passenger.new({"name": "bean"})
passenger2 = Passenger.new({"name": "bean1"})
passenger3 = Passenger.new({"name": "bean2"})
passenger4 = Passenger.new({"name": "bean3"})
passenger5 = Passenger.new({"name": "bean4"})

ride1 = Ride.new({"length": "long trip", "driver": driver1, "passenger": passenger1})
ride2 = Ride.new({"length": "long trip", "driver": driver2, "passenger": passenger1})
ride3 = Ride.new({"length": "long trip", "driver": driver1, "passenger": passenger2})
ride4 = Ride.new({"length": "long trip", "driver": driver1, "passenger": passenger2})
ride5 = Ride.new({"length": "long trip", "driver": driver3, "passenger": passenger1})
ride5 = Ride.new({"length": "long trip", "driver": driver2, "passenger": passenger1})
ride7 = Ride.new({"length": "long trip", "driver": driver2, "passenger": passenger5})