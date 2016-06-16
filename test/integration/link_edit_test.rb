require 'test_helper'

class AuthenticatedUserLinkEditTest < ActionDispatch::IntegrationTest
  test "authenticated user can mark a link as 'read' from link index" do
    user = User.create(email: 'brant@email.com', password: 'password')
    Link.create(url: "https://www.turing.io/", title: "Turing School", user_id: user.id)

    login(user)

    assert page.has_content?('Turing School')
    assert page.has_content?('Mark as Read')

    click_on 'Mark as Read'

    assert page.has_content?('Mark as Unread')

    click_on 'Mark as Unread'

    assert page.has_content?('Mark as Read')
  end

  test "authenticated user can edit a title and url of a link" do
    user = User.create(email: "brant@email.com", password: 'password')
    Link.create(url: "https://www.turing.io/", title: "Turing School", user_id: user.id)

    login(user)

    assert page.has_button?('Edit')

    click_on 'Edit'

    fill_in 'Title', with: "Google"
    fill_in 'Url', with: 'https://www.google.com'
    click_on 'Submit'

    assert page.has_link?('Google')
  end

  test "user cannot create invalid link through edit" do
    user = User.create(email: "brant@email.com", password: 'password')
    Link.create(url: "https://www.turing.io/", title: "Turing School", user_id: user.id)

    login(user)

    assert page.has_button?('Edit')

    click_on 'Edit'

    fill_in 'Title', with: "Google"
    fill_in 'Url', with: 'https:???   www.google.com'
    click_on 'Submit'

    assert page.has_content?('Url is not a valid URL')
  end

end
