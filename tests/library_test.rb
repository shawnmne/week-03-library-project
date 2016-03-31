require "test_helper"
require_relative "../lib/library.rb"

class LibraryTest < Minitest::Test 

	#test should be created under normal circumstances
	def test_should_be_created_under_normal_circumstances
		lib = Library.new(branch_name: "North West", address: "2121 West St", 
					phone: "555-567-5824")
		refute_nil(lib)
	end

	#test connection between staff member and library
	def test_connection_between_staff_member_and_library
		lib = Library.new(branch_name: "North West", address: "2121 West St", 
					phone: "555-567-5824")
		lib.save
		staff = StaffMember.new(name: "Wagner", email_address: "wschnitzel@library.org", 
						library_id: nil)
		staff.save
		staff.library = lib
		assert_equal(lib, staff.library)
		staff.destroy
		lib.destroy
	end



end
