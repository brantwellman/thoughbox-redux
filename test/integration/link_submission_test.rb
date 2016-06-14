require 'test_helper'

class AuthenticatedUserLinkSubmissionTest < ActionDispatch::IntegrationTest
  test "authenticated user can submit a link from link index" do
    user = User.create(email: 'brant@email.com', password: 'password')
    login(user)

    visit root_path

    assert page.has_content?('Submit your happy link here')

    fill_in "Url", with: "https://www.turing.io/"
    fill_in "Title", with: "Turing School"
    click_on "Submit"

    assert page.has_link?("Turing School")
  end

end
