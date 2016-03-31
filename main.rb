require_relative "config/environment.rb"
require "active_record"
require "pry"
require "yaml"
require_relative "lib/library.rb"
require_relative "lib/staff_member.rb"
require_relative "lib/book.rb"
require_relative "lib/patron.rb"


#main_menu method allows a user to select between 5 different
#   options - library, patron, book, staff member, and exit
#
#
#select is returned
def main_menu
	puts "\n1 Library\n2 Staff Members\n3 Books\n4 Patrons\n0 Exit\n"
	print"Please make a selection: "
	select = gets.chomp.to_i

	if select == 1
#		library

 	elsif select == 2
# 	staff member


	elsif select == 3
#   books


	elsif select == 4
#   patron


	elsif select == 0
		puts "\nGoodbye"
	else
		puts "\nInvalid choice selected\n"		 		
	end
	select
end



puts "\nWelcome to the Library Interface\n"
puts "\nWhat would you like to do?\n"

choice = 9

while choice != 0
	choice = main_menu
end	

binding.pry	
 





