require 'test_helper'

class AuthenticatedUserTest < ActionDispatch::IntegrationTest
  test "authenticated user can log out test" do
    user = User.create(email: "brant@email.com", password: "password")

    login(user)

    assert root_path, current_path
    assert page.has_link?("Log out")
    refute page.has_link?("Log in")

    click_on "Log out"

    assert login_path, current_path
    assert page.has_content?("Provide your juicy details to log yourself in")
  end
end
