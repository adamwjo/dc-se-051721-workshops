class Pokemon < ApplicationRecord
    has_many :pokeballs
    has_many :trainers, through: :pokeballs

    validates :name, uniqueness: true, presence: true
    validates :image, presence: true
    validates :poke_type, inclusion: { in: %w(grass fire water),
    message: "%{value} is not a valid pokemon type" }
end
