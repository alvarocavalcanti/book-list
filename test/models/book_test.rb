require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
  	@new_book = Book.new
  	@new_book.url = "http://www.url.com"
  	@new_book.title = "A Random Title"
  	@new_book.price_initial = 0.0
  	@new_book.price_current = 0.0
  	@new_book.isbn = "01010101010"
  	@new_book.author = "John Doe"
  	@new_book.bought = false
  	@new_book.read = false
  end

  test "should not save an empty book" do
  	book = Book.new
  	assert_not book.save, "Saved an empty book"
  end

  test "should not save a book with an existing URL" do
  	@new_book.url = books(:monsterhigh).url

  	assert_not @new_book.save, "Saved a book with an existing URL"
  end

  test "should not save a book with an existing ISBN" do
  	@new_book.isbn = books(:monsterhigh).isbn

  	assert_not @new_book.save, "Saved a book with an existing ISBN"
  end

end
