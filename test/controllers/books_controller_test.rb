require 'test_helper'

class BooksControllerTest < ActionController::TestCase

	setup do
		@book_params = 
		{
			book: {
				url: "http://url.to/book", 
				title: "Book Title", 
				price_initial: 0.0, 
				price_current: 0.0,
				isbn: "123456789", 
				bought: false, 
				read: false, 
				author: "Book Author", 
				user_id: users(:alvarogmail).id
			}
		}

		@book_contodefadas = 
		{
			book: {
				url: books(:contosdefadas).url, 
				title: books(:contosdefadas).title, 
				price_initial: books(:contosdefadas).price_initial, 
				price_current: books(:contosdefadas).price_current,
				isbn: books(:contosdefadas).isbn, 
				bought: books(:contosdefadas).bought, 
				read: books(:contosdefadas).read, 
				author: books(:contosdefadas).author, 
				user_id: books(:contosdefadas).user_id,
				id: 11
			}
		}
	end

	test "should not access the new route without a URL" do
		assert_raises ActionController::ParameterMissing do 
			get :new, nil, session_dummy 
		end
	end

	test "shoud create a book when providing an URL" do
		get :new, {url: "http://url.to/book"}, session_dummy
		assert_response :success
		assert_not_nil assigns(:book)
		assert_equal "http://url.to/book", assigns(:book).url
	end

	test "should not create a book without any parameter" do
		assert_raises ActionController::ParameterMissing do 
			get :create, nil, session_dummy
		end
	end

	test "should not create a book with the same parameters as an existing one" do
		get :create, @book_contodefadas, session_dummy
		assert_not_nil flash[:danger]
		assert_template :new
	end

	test "should create a book when the proper parameters are provided" do
		get :create, @book_params, session_dummy
		assert_not_nil assigns(:book)
		assert_redirected_to book_path(assigns(:book))
	end

	test "should not update a book without any parameter" do
		assert_raises ActionController::ParameterMissing do 
			put :update, {id: 1}, session_dummy
		end
	end

	test "should update a book" do
		put :update, {id: '11', book: {
				url: books(:contosdefadas).url, 
				title: 'new title', 
				price_initial: books(:contosdefadas).price_initial, 
				price_current: books(:contosdefadas).price_current,
				isbn: books(:contosdefadas).isbn, 
				bought: books(:contosdefadas).bought, 
				read: books(:contosdefadas).read, 
				author: books(:contosdefadas).author, 
				user_id: books(:contosdefadas).user_id,
				id: '11'
			}}, session_dummy	
		assert_equal 'new title', assigns(:book).title
	end

end
