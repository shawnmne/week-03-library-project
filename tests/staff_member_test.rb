require "test_helper"
require_relative "../lib/staff_member.rb"

class StaffMemberTest < Minitest::Test 

	#test should be created under normal circumstances
	def test_should_be_created_under_normal_circumstances
		staff = StaffMember.new(name: "Wagner", email_address: "wschnitzel@library.org", 
						library_id: 1)
		refute_nil(staff)
	end


end