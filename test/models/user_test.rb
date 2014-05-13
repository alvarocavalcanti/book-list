require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@new_user = User.new
  	@new_user.username = "myusername"
  	@new_user.email = "my@email.com"
  	@new_user.password = "123456"
  end

  test "should not create an empty User" do
  	user = User.new

  	assert_not user.save, "Saved an empty User"
  end

  test "should not create an user with an existing email" do
  	@new_user.email = users(:alvarogmail).email

  	assert_not @new_user.save, "Saved a User with an existing email"
  end

  test "should not create an user with an existing username" do
  	@new_user.username = users(:alvarogmail).username

  	assert_not @new_user.save, "Saved a User with an existing username"
  end
end
