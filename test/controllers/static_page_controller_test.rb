require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "StrongPizza"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
