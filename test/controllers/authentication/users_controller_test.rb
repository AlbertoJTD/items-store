require "test_helper"

class Authentication::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new user" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: 'juan@mail.com', username: 'juanperez', password: 'testme' } }
    end

    assert_redirected_to products_url
  end
end
