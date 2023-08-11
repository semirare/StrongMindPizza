require "rails_helper"

describe Pizza, :type => :model do
    before do
        @pizza = create(:pizza_2)
        @topping = create(:topping_2)
        @pizza_topping = create(:pizza_topping)
    end

    it "is valid with valid pizza and topping ids" do
        expect(PizzaTopping.new(pizza_id: @pizza.id, topping_id: @topping.id)).to be_valid
    end

    it "is not valid with invalid pizza and topping ids" do
        expect(PizzaTopping.new(pizza_id: 3, topping_id: @topping_id)).to_not be_valid
        expect(PizzaTopping.new(pizza_id: @pizza.id, topping_id: 3)).to_not be_valid
    end

    it "is not valid with a pizza/topping id combo that already exists" do
        expect(PizzaTopping.new(pizza_id: @pizza_topping.pizza_id, topping_id: @pizza_topping.topping_id)).to_not be_valid
    end
end