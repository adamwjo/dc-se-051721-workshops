class Pokemon < ApplicationRecord
    validates :name, uniqueness: true, presence: true
end
