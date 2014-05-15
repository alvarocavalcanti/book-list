require 'test_helper'

class BooklistControllerTest < ActionController::TestCase

	test "should get index when logged in" do
		get :index, nil, session_dummy
		assert_response :success
		assert_not_nil assigns(:books)
	end

	test "should be redirected to new session when not logged" do
		get :index
		assert_redirected_to new_session_path
	end

end
