class Song < ApplicationRecord
    has_many :reviews 
    has_many :super_fans, through: :reviews

    has_many :my_fans, class_name:  "SuperFan"

    def self.most_reviewed
        self.all.max_by { |song| song.reviews.count }
    end

end
