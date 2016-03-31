require "test_helper"
require_relative "../lib/book.rb"

class BookTest < Minitest::Test 

	#test should be created under normal circumstances
	def test_should_be_created_under_normal_circumstances
		book = Book.new(title: "Avoiding Syntax Errors", author: "Shawn Michaud",
						isbn: 4567891230, library_id: 1, patron_id: nil)
		refute_nil(book)
	end


end