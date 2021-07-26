class Review < ApplicationRecord
    belongs_to :song
    belongs_to :super_fan

    # rating must be between 1..10
    validates :rating, numericality: {less_than_or_equal_to: 10, greater_than: 0}
    # fan can only review sone once
    validates :super_fan_id, uniqueness: {scope: :song_id, message: "already left a review for this song"}
end
