require 'rails_helper';

describe "Pizzas", type: :request do

    before do
        @pizza = create(:pizza_2)
    end

    describe "GET /pizzas" do
        it 'renders the index template' do
            get '/pizzas'
            expect(response).to render_template(:index)
        end
    end

    describe "POST /pizzas" do

        it 'creates a new pizza and renders the edit template' do
            post '/pizzas', :params => { :pizza => {:name => "Cheese Pizza"} } 
            expect(response.code).to eq("302")
            follow_redirect!
            expect(response).to render_template(:edit)
            expect(response.body).to include("Cheese Pizza")
        end
    end

    describe "PUT /pizzas" do

        it "updates a pizza's name and redirects to the edit page" do
            put_url = "/pizzas/#{@pizza.id}"
            put put_url, params: {pizza: {name: "Pepperoni Pizza"} }, headers: {'HTTP_REFERER' => put_url}
            expect(response).to redirect_to put_url
            expect(response.code).to eq("302")
        end
    end

    describe "DELETE /pizzas" do

        it 'deletes a pizza and redirects to toppings index' do
            delete "/pizzas/#{@pizza.id}"
            expect(response.code).to eq("302")
            expect(response).to redirect_to pizzas_url
        end
    end
end