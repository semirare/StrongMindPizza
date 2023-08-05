class Topping < ApplicationRecord
    validates :name, length: { maximum: 20},
                     presence: true
    belongs_to :pizza
end
