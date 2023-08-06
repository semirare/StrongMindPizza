require "test_helper"

class PizzaToppingTest < ActiveSupport::TestCase
  def setup
    @pizza1 = Pizza.create(name: 'test')
    @pizza2 = Pizza.create(name: 'test2')
    @topping1 = Topping.create(name: 'test')
    @topping2 = Topping.create(name: 'test2')
    @pizza_topping = PizzaTopping.create(pizza_id: @pizza1.id, topping_id: @topping1.id)
  end

  test "should allow valid pizza/topping pairs" do
    valid_pairs = [[@pizza1.id, @topping1.id], [@pizza1.id, @topping2.id], [@pizza2.id, @topping1.id], [@pizza2.id, @topping2.id]]
    valid_pairs.each do |valid_pair|
      @pizza_topping.pizza_id = valid_pair[0]
      @pizza_topping.topping_id = valid_pair[1]
      assert @pizza_topping.valid? "#{valid_pair.inspect} should be valid"
    end
  end

  test "should not allow invalid pizza/topping pairs" do
    invalid_pairs = [[@pizza1.id, 0], [@pizza2.id, 0], [0, @topping1.id], [0, @topping2.id]]
    invalid_pairs.each do |invalid_pair|
      @pizza_topping.pizza_id = invalid_pair[0]
      @pizza_topping.topping_id = invalid_pair[1]
      assert_not @pizza_topping.valid? "#{invalid_pair.inspect} should be invalid"
    end
  end

  test "pizza/toppings pair should be unique" do
    duplicate_pizza_topping = @pizza_topping.dup
    @pizza_topping.save
    assert_not duplicate_pizza_topping.valid?
  end
end
