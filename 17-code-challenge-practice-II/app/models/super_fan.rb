class SuperFan < ApplicationRecord
    belongs_to :song

    has_many :reviews, dependent: :destroy
    has_many :songs, through: :reviews
end
