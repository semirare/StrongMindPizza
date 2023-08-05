require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_page/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", pizzas_path
    assert_select "a[href=?]", toppings_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
  end
end
