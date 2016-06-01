require 'test_helper'

class UnauthenticatedUserTest < ActionDispatch::IntegrationTest
  test "unauthenticated user redirected to login page" do
    visit root_path

    assert_equal portal_path, current_path
    assert page.has_link?('Log In')
    assert page.has_link?('Sign Up')
  end
end
