class Pizza < ApplicationRecord
    has_many :toppings
    validates :name, presence: true
end
