require 'rails_helper';

describe "Pizzas", type: :request do

    before do
        @pizza = create(:pizza_2)
        @topping = create(:topping_2)
        @pizza_topping = create(:pizza_topping)
    end

    describe "POST /pizza_toppings" do

        it 'creates a new pizza topping and redirects to the pizza edit page' do
            pizza_edit_url = "/pizzas/#{@pizza.id}/edit"
            post '/pizza_toppings', params: { pizza_topping: { pizza_id: @pizza.id, topping_id: @topping.id } },
                headers: {'HTTP_REFERER' => pizza_edit_url} 
            expect(response).to redirect_to pizza_edit_url
            expect(response.code).to eq("302")
        end
    end

    describe "DELETE /pizza_toppings" do

        it 'deletes a pizza topping and redirects to the pizza edit page' do
            pizza_edit_url = "/pizzas/#{@pizza_topping.pizza.id}/edit"
            delete "/pizza_toppings/#{@pizza_topping.id}", headers: {'HTTP_REFERER' => pizza_edit_url}
            expect(response.code).to eq("302")
            expect(response).to redirect_to pizza_edit_url
        end
    end
end