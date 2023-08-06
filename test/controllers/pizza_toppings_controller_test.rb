require "test_helper"

class PizzaToppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizza_topping = pizza_toppings(:one)
    @pizza = pizzas(:one)
    @pizza2 = pizzas(:two)
    @topping = toppings(:one)
  end

  test "should get index" do
    get pizza_toppings_url
    assert_response :success
  end

  test "should get new" do
    get new_pizza_topping_url
    assert_response :success
  end

  test "should create pizza topping" do
    assert_difference("PizzaTopping.count") do
      post pizza_toppings_url, params: { pizza_topping: { pizza_id: @pizza2.id, topping_id: @topping.id } }
    end

    assert_redirected_to pizza_topping_url(PizzaTopping.last)
  end

  test "should not allow duplicate pairs" do
    #attempt to post pizza topping with same pizza_id and topping_id as fixture pizza topping one that already exists
    post pizza_toppings_url, params: { pizza_topping: { pizza_id: @pizza.id, topping_id: @topping.id } }
    assert_response 422
  end

  test "should not allow ids that do not exist" do
    post pizza_toppings_url, params: { pizza_topping: { pizza_id: @pizza.id, topping_id: 0 } }
    assert_response 422

    post pizza_toppings_url, params: { pizza_topping: { pizza_id: 0, topping_id: @topping.id } }
    assert_response 422
  end

  test "should show pizza toppings" do
    get pizza_topping_url(@pizza_topping)
    assert_response :success
  end

  test "should get edit" do
    get edit_pizza_topping_url(@pizza_topping)
    assert_response :success
  end

  test "should update pizza topping" do
    patch pizza_topping_url(@pizza_topping), params: { pizza_topping: { pizza_id: @pizza2.id } }
    assert_redirected_to pizza_topping_url(@pizza_topping)
  end

  test "should destroy pizza topping" do
    assert_difference("PizzaTopping.count", -1) do
      delete pizza_topping_url(@pizza_topping)
    end

    assert_redirected_to pizza_toppings_url
  end
end
