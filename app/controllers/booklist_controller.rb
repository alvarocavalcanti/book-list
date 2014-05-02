class BooklistController < ApplicationController
	def index
		@books = Book.where(user_id: 4)
	end
end
