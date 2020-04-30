require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest

  test "get signup form and create user" do
    get signup_path
    assert_template "users/new"
    assert_difference 'User.count', 1 do
      post users_path, params:{user:{username:"testuser", email: "test@example.com", password: "password"}}
      follow_redirect!
    end
    assert_template 'articles/index'
    assert_match "testuser", response.body
  end
end