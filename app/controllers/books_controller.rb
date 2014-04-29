class BooksController < ApplicationController
	def new
		if !params.has_key?(:url) || params[:url].blank?
			flash[:danger] = "Please provdie a URL."
			redirect_to home_path
		end
		@book = Book.new(search_params)
		@book.save
	end

	private 

	def search_params
		params.permit(:url)
	end
end
