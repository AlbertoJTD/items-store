require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get products by username' do
    get user_url(users(:alberto).username)

    assert_response :success
  end
end
