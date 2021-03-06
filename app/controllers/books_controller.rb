class BooksController < ApplicationController
	# http://bit.ly/1hPYNko

	# http://bit.ly/1fpZBlt
	def new
		@book = Book.new
		@book.url = new_book_params
	end

	def create
		@book = Book.new(book_params)

		if !@book.save
			flash[:danger] = "Could not save book."
			render 'new'
		else
			redirect_to @book
		end
	end

	def update
		params = book_params
		@book = Book.find(params[:id])

		if @book.update(params)
			redirect_to @book
		else
			render 'edit'
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def mark_as_bought
		# Duplicated code (see mark_as_uunbought), how can I remove it 'the Rails-way'? Modify the update
		# method so it receives parameters instead of fetching them from the request, and make a call to it?
		book = Book.find(params[:id])
		book.update(bought: true)
		render nothing: true
	end

	def mark_as_unbought
		# Duplciated code, see above
		book = Book.find(params[:id])
		book.update(bought: false)
		render nothing: true
	end

	def mark_as_read
		# Duplciated code, see above
		book = Book.find(params[:id])
		book.update(read: true)
		render nothing: true
	end

	def mark_as_unread
		# Duplciated code, see above
		book = Book.find(params[:id])
		book.update(read: false)
		render nothing: true
	end

	private 

	def book_params
		params.require(:book).permit(:url, :title, :price_initial, :price_current, :isbn, :bought, :read, :author, :user_id, :id)
	end

	def new_book_params
		params.require(:url)
	end

end
