class Trainer < ApplicationRecord
    has_many :pokeballs
    has_many :pokemon, through: :pokeballs
end
