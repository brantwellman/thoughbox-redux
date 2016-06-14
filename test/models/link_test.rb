require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  should validate_presence_of(:title)

  test "an invalid url is not saved" do
    Link.create(title: "Turing", url: "https://www.turing.io/")

    assert_equal 1, Link.count

    Link.create(title: "Google", url: "https:  www.google.com")

    refute_equal 2, Link.count
  end
end
