require "application_system_test_case"

class PizzasTest < ApplicationSystemTestCase
  setup do
    @pizza = pizzas(:one)
  end

  test "visiting the index" do
    visit pizzas_url
    assert_selector "h1", text: "Create New Pizza"
    assert_selector "h1", text: "Pizza Menu"
  end

  test "should create pizza" do
    visit pizzas_url

    fill_in "Name", with: "Test"
    click_on "Create Pizza"

    assert_text "Test was created."
  end

  test "should open pizza edit page" do
    visit pizzas_url

    click_on "Edit", match: :first

    assert_selector "h1", text: "Editing #{@pizza.name}"
    click_on "Back to Pizza Menu"
  end

  test "should update pizza name" do
    visit edit_pizza_url(@pizza)

    fill_in "Name", with: "Test2"
    click_on "Update Pizza Name"

    assert_selector "h1", text: "Editing Test2"
    click_on "Back to Pizza Menu"
  end

  test "should remove topping" do
    visit edit_pizza_url(@pizza)

    assert_selector "h6", text: "Ham"
    click_on "Remove", match: :first
    assert_no_selector "h6", text: "Ham" 

    click_on "Back to Pizza Menu"
  end

  test "should delete pizza" do
    visit pizzas_url
    click_on "Delete", match: :first

    assert_text "#{@pizza.name} was deleted."
  end
end
