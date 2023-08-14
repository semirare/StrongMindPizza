module PizzaToppingsHelper

    def new_topping_choices_for(pizza_id)
        #returns all the toppings that exist that are not already associated with the given pizza
        Topping.all.order(Arel.sql('lower(name)')).reject { |topping| PizzaTopping.exists?(pizza_id: pizza_id, topping_id: topping.id)}
    end
    
end