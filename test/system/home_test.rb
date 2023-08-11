require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_text "Manage Pizzas"
    assert_text "Manage Toppings"
  end

  test "manage pizzas navigates to pizzas pages" do
    visit root_url
    click_on "Manage Pizzas"
    assert_selector "h1", text: "Create New Pizza"
  end

  test "manage toppings navigates to toppings pages" do
    visit root_url
    click_on "Manage Toppings"
    assert_selector "h1", text: "Add New Topping"
  end

  test "about navigates to about page" do
    visit root_url
    click_on "About"
    assert_text "This is the StrongPizza app"
  end

end
