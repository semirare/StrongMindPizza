require "test_helper"

class PizzasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pizza = pizzas(:one)
  end

  test "should get index" do
    get pizzas_url
    assert_response :success
  end

  test "should create pizza" do
    assert_difference("Pizza.count") do
      post pizzas_url, params: { pizza: { name: 'test' } }
    end

    assert_redirected_to edit_pizza_url(Pizza.last)
  end

  test "should not allow names over 50 chars" do
    post pizzas_url, params: { pizza: { name: 'a' * 51 } }
    assert_response 422
  end

  test "should not allow duplicate names" do
    #attempt to post pizza with same name as fixture pizza one that already exists
    post pizzas_url, params: { pizza: { name: @pizza.name } }
    assert_response 422
  end

  test "should get edit" do
    get edit_pizza_url(@pizza)
    assert_response :success
  end

  test "should update pizza" do
    
    patch pizza_url(@pizza), params: { pizza: { name: @pizza.name } }
    assert_redirected_to root_url
  end

  test "should destroy pizza" do
    assert_difference("Pizza.count", -1) do
      delete pizza_url(@pizza)
    end

    assert_redirected_to pizzas_url
  end
end
