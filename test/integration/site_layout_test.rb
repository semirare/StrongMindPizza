require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'pizzas/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", pizzas_path
    assert_select "a[href=?]", toppings_path
    assert_select "a[href=?]", about_path
  end
end
