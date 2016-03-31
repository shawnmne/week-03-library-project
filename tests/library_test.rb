require "test_helper"
require_relative "../lib/library.rb"

class LibraryTest < Minitest::Test 

	#test should be created under normal circumstances
	def test_should_be_created_under_normal_circumstances
		lib = Library.new(branch_name: "North West", address: "2121 West St", 
					phone: "555-567-5824")
		refute_nil(lib)
	end
end
