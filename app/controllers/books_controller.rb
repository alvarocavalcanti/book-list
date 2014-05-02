class BooksController < ApplicationController
	# http://bit.ly/1hPYNko

	# http://bit.ly/1fpZBlt
	def new
		@book = Book.new
		@book.url = params[:url]
	end

	def create
		@book = Book.new(book_params)

		if !@book.save
			flash[:danger] = "Could not save book."
			render 'new'
		end
		redirect_to @book
	end

	def update
		@book = Book.find(params[:id])

		if @book.update(book_params)
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

	private 

	def book_params
		params.require(:book).permit(:url, :title, :price_initial, :price_current, :isbn, :bought, :read, :author, :user_id)
	end
end
