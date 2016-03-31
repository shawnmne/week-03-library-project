require "test_helper"
require_relative "../lib/patron.rb"

class PatronTest < Minitest::Test 

	#test should be created under normal circumstances
	def test_should_be_created_under_normal_circumstances
		patron = Patron.new(name: "Frank", email_address: "punisher@aol.com")
		refute_nil(patron)
	end



end