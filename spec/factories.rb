FactoryBot.define do
    factory :pizzas do
        factory :pizza_1 do
            name "Cheese Pizza"
        end

        factory :pizza_2 do
            name "Pepperoni Pizza"
        end
    end

    factory :toppings do
        factory :topping_1 do
            name "Cheese"
        end

        factory :topping_2 do
            name "Pepperoni"
        end
    end

    factory :pizza_toppings do
        factory :pizza_topping do
            relation :pizza_1
            relation :topping_1
        end
    end
end