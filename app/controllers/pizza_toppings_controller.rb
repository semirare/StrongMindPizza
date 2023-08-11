class PizzaToppingsController < ApplicationController
    before_action :set_pizza_topping, only: %i[ edit destroy ]
  
    # GET /pizza_toppings/new
    def new
      @pizza_topping = PizzaTopping.new
    end
  
    # POST /pizza_toppings or /pizza_toppings.json
    def create
      @pizza_topping = PizzaTopping.new(pizza_topping_params)
  
      respond_to do |format|
        if @pizza_topping.save
          format.html { redirect_back fallback_location: pizzas_path }
          format.json { render :show, status: :created, location: @pizza_topping }
        else
          format.html { redirect_back fallback_location: pizzas_path, status: :unprocessable_entity }
          format.json { render json: @pizza_topping.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /pizza_toppings/1 or /pizza_toppings/1.json
    def destroy
      @pizza_topping.destroy
  
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path}
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_pizza_topping
        @pizza_topping = PizzaTopping.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def pizza_topping_params
        params.require(:pizza_topping).permit(:pizza_id, :topping_id)
      end
  end
  