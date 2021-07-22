class Pokeball < ApplicationRecord
    belongs_to :trainer
    belongs_to :pokemon
end
