class BooklistController < ApplicationController
	def index
		@books = Book.where(user_id: session[:userid]).order(:updated_at).reverse_order
	end
end
