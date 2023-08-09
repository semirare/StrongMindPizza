require "test_helper"

class ToppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topping = toppings(:one)
  end

  test "should get index" do
    get toppings_url
    assert_response :success
  end

  test "should create topping" do
    assert_difference("Topping.count") do
      post toppings_url, params: { topping: { name: 'test' } }
    end

    assert_redirected_to toppings_url
  end

  test "should not allow names over 50 chars" do
    post toppings_url, params: { topping: { name: 'a' * 51 } }
    assert_response 422
  end

  test "should not allow duplicate names" do
    #attempt to post topping with same name as fixture topping one that already exists
    post toppings_url, params: { topping: { name: @topping.name } }
    assert_response 422
  end

  test "should get edit" do
    get edit_topping_url(@topping)
    assert_response :success
  end

  test "should update topping" do
    patch topping_url(@topping), params: { topping: { name: @topping.name } }
    assert_redirected_to toppings_url
  end

  test "should destroy topping" do
    assert_difference("Topping.count", -1) do
      delete topping_url(@topping)
    end

    assert_redirected_to toppings_url
  end
end
