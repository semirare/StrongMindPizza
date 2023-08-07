module PizzaToppingsHelper

    def topping_names_for(pizza)
        pizza.pizza_toppings.map { |topping| Topping.find(topping.topping_id).name } 
    end

end