require 'test_helper'

class PizzaToppingsHelperTest < ActionView::TestCase

    setup do
        @pizza = pizzas(:one)
        @topping1 = toppings(:one)
        @topping2 = toppings(:two)
        @pizza_topping = pizza_toppings(:one)
    end

    test "toppings_for returns the toppings for the given pizza" do
        assert @controller.toppings_for(@pizza.id) == [@topping1.id]
    end

    test "pizza_topping_for return the id of the pizza_topping for the given pizza_id and topping_id" do
        assert true
    end

    test "new_topping_choices_for returns a list of toppings that are not already associated with the given pizza_id" do
        assert true
    end

end