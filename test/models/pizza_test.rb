require "test_helper"

class PizzaTest < ActiveSupport::TestCase

  def setup
    @pizza = Pizza.new(name: "Cheese Pizza")
  end

  test "valid names are any non blank string under 50 characters" do
    valid_names = ['test', 'a', 'a' * 50, 'a' + ' ' * 49]
    valid_names.each do |valid_name|
      @pizza.name = valid_name
      assert @pizza.valid? "#{valid_name.inspect} should be valid"
    end
  end

  test "invalid names should be rejected" do
    invalid_names = ['', '          ', 'a' * 51]
    invalid_names.each do |invalid_name|
      @pizza.name = invalid_name
      assert_not @pizza.valid? "#{invalid_name.inspect} should be invalid"
    end
  end

  test "name should be unique" do
    duplicate_pizza = @pizza.dup
    @pizza.save
    assert_not duplicate_pizza.valid?
  end
end
