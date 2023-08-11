require "application_system_test_case"

class ToppingsTest < ApplicationSystemTestCase
  setup do
    @topping = toppings(:one)
  end

  test "visiting the index" do
    visit toppings_url
    assert_selector "h1", text: "Add New Topping"
    assert_selector "h1", text: "Topping Menu"
  end

  test "should create topping" do
    visit toppings_url

    fill_in "Name", with: "Test"
    click_on "Add Topping"

    assert_text "Test was created."
  end

  test "should open topping edit page" do
    visit toppings_url

    click_on "Edit", match: :first

    assert_selector "h1", text: "Editing #{@topping.name}"
    click_on "Back to Topping Menu"
  end

  test "should update topping name" do
    visit edit_topping_url(@topping)

    fill_in "Name", with: "Test2"
    click_on "Update Topping Name"

    assert_text "Test2 was updated."
  end

  test "should delete topping" do
    visit toppings_url
    click_on "Delete", match: :first

    assert_text "#{@topping.name} was deleted."
  end
end
