require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visits the index route" do
    visit '/'
    assert_selector "h1", text: "Welcome to Quartet"
  end

  test "clicks the Sign-Up/Login button" do
    click_on 'login'
    assert_response :ok
    assert_selector "h2", text: "Log in"
  end
end
