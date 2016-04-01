require_relative "config/environment.rb"
require "active_record"
require "pry"
require "yaml"
require_relative "lib/library.rb"
require_relative "lib/staff_member.rb"
require_relative "lib/book.rb"
require_relative "lib/patron.rb"


#make_selection method asks users to make a selection and gets input 
#    from user
#
#
def make_selection
	print "\nPlease make a selection "
	gets.chomp.to_i
end

#display_library method shows information about a selected library
#
#+selected - integer: used to identify which library to display info
def display_library(selected)
	l = Library.find(selected)
	puts "\n#{l.branch_name} is located at #{l.address}  Phone number #{l.phone}\n"
end

#show_all_libraries method shows all the libraries
#
#
#
#
def show_all_libraries
		binding.pry
		puts "\nAll Libraries\n"
		Library.all.each do  |library|
			puts "#{library.id}  #{library.branch_name}"
		end
end

#add_library method gathers information from user to create a new library
#
#
#
def add_library
	puts "\nTo add a new library please enter the following requested information:\n"
	print "Library name "
	branch_name = gets.chomp
	print "Library address "
	address = gets.chomp
	print "Library phone number "
	phone = gets.chomp
	Library.create(branch_name: branch_name, address: address, phone: phone)
end

#edit_library method allows the user to edit a library that has been selected
#
#+selected - integer: identifies the library that has been selected
#
def edit_library(selected)
	edit_library_name(selected)
	edit_library_addrss(selected)
	edit_library_phone(selected)
end

#edit_library_name method edits library name
# 
#+selected - integer:  identifies the selected library
#
def edit_library_name(selected)
	l = Library.find(selected)
	print "\nTo edit the library name please enter here: "
	branch_name = gets.chomp
	l.update_attributes(branch_name: branch_name)
end

#edit_library_address method edits library address
#
#+selected - integer: identifes the selected library
#
def edit_library_address(selected)
	l = Library.find(selected)
	print "To edit the library address please enter here: "
	address = gets.chomp
	l.update_attributes(address: address)
end

#edit_library_phone method edits library phone number
#
#+selected - integer: identifes the selected library
#
def edit_library_phone(selected)
	l = Library.find(selected)
	print "To edit the library phone number please enter here: "
	phone = gets.chomp
	l.update_attributes(phone: phone)	
end

#remove_library method closes a library and removes it's record
#
#+selected - integer: identifies the selected library
#
def remove_library(selected)
	l = Library.find(selected)
	l.destroy
end

#select_choice_library method allows the user to select 
#   a chice from a menu in the library directory
#
#
#
#returns select
def select_choice_library
	puts "\n1 Add a Library\n2 Examine a Library\n3 Edit a Library\n4 Remove a Library\n5 View All Libraries\n6 View Staff Members\n0 Return to Main Menu"
	select = make_selection

	if select == 1
		add_library

	elsif select == 2
		puts "\nTo examine a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection
		display_library(select)

	elsif select == 3
		puts "\nTo edit a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection
		edit_library(select)

	elsif select == 4
		puts "\nTo remove a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection
		remove_library(select)

	elsif select == 5
		show_all_libraries

	elsif select == 6
		#view library staff
		puts "staff"

	elsif select == 0
		puts "\nNow entering main menu\n"

	else
		puts "\nInvalid choice selected\n"		 		

	end
	select		
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
		library_choice = 9
		while library_choice != 0
			library_choice = select_choice_library
		end

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


def main
	puts "\nWelcome to the Library Interface\n"
	puts "\nWhat would you like to do?\n"

	choice = 9

	while choice != 0
		choice = main_menu
	end	
end

main 
#binding.pry	
 





