require "test_helper"
require_relative "../lib/book.rb"

class BookTest < Minitest::Test 

	#test should be created under normal circumstances
	def test_should_be_created_under_normal_circumstances
		book = Book.new(title: "Avoiding Syntax Errors", author: "Shawn Michaud",
						isbn: "4567891230", library_id: 1, patron_id: nil)
		refute_nil(book)
	end

	#test connection between book and library
	def test_connection_between_book_and_library
		b = Book.new(title: "Avoiding Syntax Errors", author: "Shawn Michaud",
						isbn: "4567891230", library_id: nil, patron_id: nil)
		lib = Library.new(branch_name: "North West", address: "2121 West St", 
					phone: "555-567-5824")
  	b.save
		lib.save
		b.library = lib
		assert_equal(lib, b.library)
		b.destroy
		lib.save
	end

	#test connection between book and patron
	def test_connection_between_book_and_patron
		b = Book.new(title: "Avoiding Syntax Errors", author: "Shawn Michaud",
						isbn: "4567891230", library_id: nil, patron_id: nil)
		b.save		
		p = Patron.new(name: "Frank", email_address: "punisher@aol.com")
		p.save
		b.patron = p
		assert_equal(p, b.patron)
		b.destroy
		p.destroy
	end
	



end