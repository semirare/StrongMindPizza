module PizzaToppingsHelper

    def toppings_for(pizza)
        #returns all toppings for the given pizza
        pizza.pizza_toppings.map { |topping| Topping.find(topping.topping_id) } 
    end

    def pizza_topping_for(pizza_id, topping_id)
        #given a topping and pizza, get the pizza_topping row that corresponds
        PizzaTopping.where(pizza_id: pizza_id, topping_id: topping_id).first
    end

    def new_topping_choices_for(pizza_id)
        #returns all the toppings that exist that are not already associated with the given pizza
        Topping.all.order(Arel.sql('lower(name)')).reject { |topping| PizzaTopping.exists?(pizza_id: pizza_id, topping_id: topping.id)}
    end
end