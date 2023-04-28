require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    get contact_path
    assert_select "title", full_title("Contact")
  end
  
  test "full title helper" do
    assert_equal "#{@base_title}", full_title
    assert_equal "Help | #{@base_title}", full_title("Help")
    assert_equal "About | #{@base_title}", full_title("About")
    assert_equal "Sign up | #{@base_title}", full_title("Sign up")
  end
end
