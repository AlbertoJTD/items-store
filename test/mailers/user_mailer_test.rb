require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = users(:alberto)
  end

  test "welcome" do
    mail = UserMailer.with(user: @user).welcome
    assert_equal "Welcome to ItemsStore", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["no-reply@itemsStore.com"], mail.from
    assert_match "Hey #{@user.username}, welcome to ItemsStore, We hope you sell a lot", mail.body.encoded
  end
end
