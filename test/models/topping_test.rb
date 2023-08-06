require "test_helper"

class ToppingTest < ActiveSupport::TestCase

  def setup
    @topping = Topping.new(name: "Cheese topping")
  end

  test "valid names are any non blank string under 50 characters" do
    valid_names = ['test', 'a', 'a' * 50, 'a' + ' ' * 49]
    valid_names.each do |valid_name|
      @topping.name = valid_name
      assert @topping.valid? "#{valid_name.inspect} should be valid"
    end
  end

  test "invalid names should be rejected" do
    invalid_names = ['', '          ', 'a' * 51]
    invalid_names.each do |invalid_name|
      @topping.name = invalid_name
      assert_not @topping.valid? "#{invalid_name.inspect} should be invalid"
    end
  end

  test "name should be unique" do
    duplicate_topping = @topping.dup
    @topping.save
    assert_not duplicate_topping.valid?
  end
end
