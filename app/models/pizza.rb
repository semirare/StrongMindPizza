class Pizza < ApplicationRecord
    has_many :pizza_toppings, dependent: :destroy
    validates :name, length: { maximum: 50 },
                     presence: true,
                     uniqueness: true
end
