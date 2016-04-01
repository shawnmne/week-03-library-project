require_relative "config/environment.rb"
require "active_record"
require "pry"
require "yaml"
require_relative "lib/library.rb"
require_relative "lib/staff_member.rb"
require_relative "lib/book.rb"
require_relative "lib/patron.rb"

def make_selection
	print "Please make a selection "
	gets.chomp.to_i
end

#show_all_libraries method shows all the libraries
#
#
#
#
def show_all_libraries
		puts "\nAvailable Libraries\n"
		Library.all.each_with_index do  |library, index|
			puts "#{index}  #{library.branch_name}"
		end
end

#select_choice_library method allows the user to select 
#   a chice from a menu in the library directory
#
#
#
#
def select_choice_library
	puts "\n1 Add a Library\n2 Examine a Library\n3 Edit a Library\n4 Remove a Library\n5 View All Libraries\n6 View Staff Members\n0 Return to Main Menu"
	select = make_selection
end

#main_menu method allows a user to select between 5 different
#   options - library, patron, book, staff member, and exit
#
#
#select is returned
def main_menu
	puts "\n1 Library\n2 Staff Members\n3 Books\n4 Patrons\n0 Exit\n"
	select = make_selection

	if select == 1
		show_all_libraries
		select_choice_library

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

#binding.pry	
 





