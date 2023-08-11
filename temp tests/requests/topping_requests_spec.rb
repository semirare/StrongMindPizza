require 'rails_helper';

describe "Toppings", type: :request do

    before do
        @topping = create(:topping_2)
    end

    describe "GET /toppings" do
        it 'render the index template' do
            get '/toppings'
            expect(response).to render_template(:index)
        end
    end

    describe "POST /toppings" do

        it 'creates a new topping and redirects to toppings index' do
            post '/toppings', params: {topping: {name: "Cheese"} } 
            expect(response.code).to eq("302")
            follow_redirect!
            expect(response).to render_template(:index)
            expect(response.body).to include("Cheese")
        end
    end

    describe "PUT /toppings" do

        it "updates a topping's name and redirects to toppings index" do
            put_url = "/toppings/#{@topping.id}"
            put put_url, params: {topping: {name: "Peppers"} }
            expect(response).to redirect_to toppings_url
            expect(response.code).to eq("302")
        end
    end

    describe "DELETE /toppings" do

        it 'deletes a topping and redirects to toppings index' do
            delete "/toppings/#{@topping.id}"
            expect(response.code).to eq("302")
            expect(response).to redirect_to toppings_url
        end
    end
end