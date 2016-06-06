require 'test_helper'

class UnauthenticatedUserTest < ActionDispatch::IntegrationTest
  test "unauthenticated user redirected to login page" do
    visit root_path

    assert_equal portal_path, current_path
    assert page.has_link?('Log In')
    assert page.has_link?('Sign Up')
  end

  test "unauthenticated user can sign up" do
    visit root_path

    click_on "Sign Up"
    fill_in "Email", with: "brant@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Submit"

    assert page.has_content?('All of the Links')
  end

  test "user can't sign up duplicate email" do
    create(:user)

    visit root_path

    click_on "Sign Up"
    fill_in "Email", with: "brant@email.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_on "Submit"

    assert page.has_content?("Email has already been taken")
  end

  test "user can't sign up with unmatched password and confirmation" do
    visit new_user_path

    fill_in "Email", with: "brant@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "unmatched"
    click_on "Submit"

    assert page.has_content?("Password confirmation doesn't match Password")
  end
end
