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
	gets.chomp
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
	edit_library_address(selected)
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

#verify_library_exists method verifies the library selected exists
#
#+selected - integer: identifies the library selected
#
#seleceted is an actual existing library that is returned  
#credit kyle
def verify_library_exists(selected)
	while Library.find_by_id(selected).nil?
		puts "\nNo libraries identified as entered\n"
		show_all_libraries
		selected = make_selection.to_i
	end
	selected
end

#show_staff_at_library method shows the staff currently at a library
#
#+selected - integer: identifes the library selected
#
def show_staff_at_library(selected)
	l = Library.find_by_id(selected).staff_members
	if l == []
		puts "\nNo current staff members at this library\n"
	else
		puts "\n"
		l.each do |staff_member|
			puts "#{Library.find_by_id(selected).branch_name} currently employs #{staff_member.name}"
		end
	end
end



#select_choice_library method allows the user to select 
#   a chice from a menu in the library directory
#
#
#
#returns select
def select_choice_library
	puts "\n1 Add a Library\n2 Information on a Library\n3 Edit a Library\n4 Remove a Library\n5 View All Libraries\n6 View Staff Members\n0 Return to Main Menu"
	select = make_selection

	while select != "1" && select != "2" && select != "3" && select != "4" && select != "5" && select != "6" && select != "0"
		puts "\nInvalid choice selected\n"		 		
		select = make_selection
	end

	if select == "1"
		add_library

	elsif select == "2"
		puts "\nTo get information about a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection.to_i
		select = verify_library_exists(select)
		display_library(select)

	elsif select == "3"
		puts "\nTo edit a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection.to_i
		select = verify_library_exists(select)
		edit_library(select)

	elsif select == "4"
		puts "\nTo remove a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection.to_i
		select = verify_library_exists(select)
		remove_library(select)

	elsif select == "5"
		show_all_libraries

	elsif select == "6"
		puts "\nTo see employees at a library please enter it's ID #\n"
		show_all_libraries
		select = make_selection.to_i
		select = verify_library_exists(select)
		show_staff_at_library(select)


	elsif select == "0"
		puts "\nNow entering main menu\n"

	end
	select		
end



#edit_book method allows the user to edit a book that has been selected
#
#+selected - integer: identifies the book that has been selected
#
def edit_book(selected)
	edit_book_title(selected)
	edit_book_author(selected)
	edit_book_isbn(selected)
end

#edit_book_title method edits book title
# 
#+selected - integer:  identifies the selected book
#
def edit_book_title(selected)
	b = Book.find(selected)
	print "\nTo edit the book title please enter here: "
	title = gets.chomp
	b.update_attributes(title: title)
end

#edit_book_author method edits book author
#
#+selected - integer: identifes the selected book
#
def edit_book_author(selected)
	b = Book.find(selected)
	print "To edit the book author please enter here: "
	author = gets.chomp
	b.update_attributes(author: author)
end

#edit_book_isbn method edits book isbm
#
#+selected - integer: identifes the selected book
#
def edit_book_isbn(selected)
	b = Book.find(selected)
	print "To edit the book isbn please enter here: "
	isbn = gets.chomp
	b.update_attributes(isbn: isbn)	
end

#edit_book_library_id method allows a user to change the home library
#     for a book
#
def edit_book_library_id
	select = make_selection.to_i
	select = verify_book_exists(select)
	print "\nWhich library would you like to call home for this book "
	library_id = gets.chomp.to_i
	library_id = verify_library_exists(library_id)
	b = Book.find(select)
	b.update_attributes(library_id: library_id)
end


#remove_book method closes a book and removes it's record
#
#+selected - integer: identifies the selected book
#
def remove_book(selected)
	b = Book.find(selected)
	b.destroy
end





#display_book method shows information about a selected book
#
#+selected - integer: used to identify which book to display info
def display_book(selected)
	b = Book.find(selected)
	puts "\n#{b.title} written by #{b.author}  ISBN #{b.isbn}"
	if b.patron_id.nil?
		puts "#{b.title} is available at #{Library.find_by_id(b.library_id).branch_name}"
	else 
		puts "#{Patron.find_by_id(b.patron_id).name} currently has this book checked out"
	end
end


#show_all_books method shows all the books
#
#
#
#
def show_all_books
		puts "\nAll Books\n"
		Book.all.each do  |book|
			puts "#{book.id}  #{book.title}"
		end
end

#verify_book_exists method verifies the book selected exists
#
#+selected - integer: identifies the book selected
#
#seleceted is an actual existing book that is returned  
#credit kyle
def verify_book_exists(selected)
	while Book.find_by_id(selected).nil?
		puts "\nNo books identified as entered\n"
		show_all_books
		selected = make_selection.to_i
	end
	selected
end


#add_book method gathers information from user to create a new book
#
#
#
def add_book
	puts "\nTo add a new book please enter the following requested information:\n"
	print "Book Title "
	title = gets.chomp
	print "Book Author "
	author = gets.chomp
	print "Book ISBN "
	isbn = gets.chomp
	print "Book Home Library "
	library_id = gets.chomp.to_i
	library_id = verify_library_exists(library_id)
	Book.create(title: title, author: author, isbn: isbn, library_id: library_id)
end

#check_out_book method allows user to check out a book
#
#
def check_out_book
	select = make_selection.to_i
	select = verify_book_exists(select)
	b = Book.find(select)
	if b.patron_id.nil?
		puts "\nPlease select patron that would like to check out book\n"
		show_all_patrons
		select = make_selection.to_i
		select = verify_patron_exists(select)
		b.update_attributes(patron_id: select)
	else
		puts "\nThis book is already checked out\n"
	end
end	

#return_book method allows user to put a book in circulation
#
#
def return_book
		select = make_selection.to_i
		select = verify_book_exists(select)
		b = Book.find(select)
		patron_id = nil
		b.update_attributes(patron_id: patron_id)
end	


#select_choice_book method allows the user to select 
#   a chice from a menu in the book directory
#
#
#
#returns select
def select_choice_book
	puts "\n1 Add a Book\n2 Information on a Book\n3 Edit a Book\n4 Remove a Book\n5 View All Books\n6 Switch Home Library for Book\n7 Check Out Book\n8 Return a Book\n0 Return to Main Menu"
	select = make_selection

	while select != "1" && select != "2" && select != "3" && select != "4" && select != "5" && select != "6" && select != "7" && select != "8" && select != "0"
		puts "\nInvalid choice selected\n"		 		
		select = make_selection
	end

	if select == "1"
		add_book

	elsif select == "2"
		puts "\nTo get information about a book please enter it's ID #\n"
		show_all_books
		select = make_selection.to_i
		select = verify_book_exists(select)
		display_book(select)

	elsif select == "3"
		puts "\nTo edit a book please enter it's ID #\n"
		show_all_books
		select = make_selection.to_i
		select = verify_book_exists(select)
	  edit_book(select)

	elsif select == "4"
		puts "\nTo remove a book please enter it's ID #\n"
		show_all_books
		select = make_selection.to_i
		select = verify_book_exists(select)
	  remove_book(select)

	elsif select == "5"
		show_all_books

	elsif select == "6"
		puts "\nTo switch home library of a book please enter it's ID #\n"
		show_all_books
		edit_book_library_id


	elsif select == "7"
		puts "\nTo check out a book please enter it's ID #\n"
		show_all_books
		check_out_book


	elsif select == "8"
		puts "\nTo return a book please enter it's ID #\n"
		show_all_books
		return_book
		puts "\nBook returned"

	elsif select == "0"
		puts "\nNow entering main menu\n"

	end
	select		
end

#show_all_patronss method shows all the patrons
#
#
#
#
def show_all_patrons
		puts "\nAll Patrons\n"
		Patron.all.each do  |patron|
			puts "#{patron.id}  #{patron.name}"
		end
end

#verify_patron_exists method verifies the patron selected exists
#
#+selected - integer: identifies the patron selected
#
#seleceted is an actual existing patron that is returned  
#credit kyle
def verify_patron_exists(selected)
	while Patron.find_by_id(selected).nil?
		puts "\nNo patrons identified as entered\n"
		show_all_patrons
		selected = make_selection.to_i
	end
	selected
end

#add_patron method gathers information from user to create a new patron
#
#
#
def add_patron
	puts "\nTo add a new patron please enter the following requested information:\n"
	print "Name "
	name = gets.chomp
	print "Email Address "
	email_address = gets.chomp
	Patron.create(name: name, email_address: email_address)
end

#display_patron method shows information about a selected patron
#
#+selected - integer: used to identify which patron to display info
def display_patron(selected)
	p = Patron.find(selected)
	puts "\n#{p.name}  #{p.email_address}"
end


#edit_patron method allows the user to edit a patron that has been selected
#
#+selected - integer: identifies the patron that has been selected
#
def edit_patron(selected)
	edit_patron_name(selected)
	edit_patron_email_address(selected)
end

#edit_patron_name method edits patron name
# 
#+selected - integer:  identifies the selected patron
#
def edit_patron_name(selected)
	p = Patron.find(selected)
	print "\nTo edit the patron name please enter here: "
	name = gets.chomp
	p.update_attributes(name: name)
end

#edit_patron_email_adress method edits patron email address
#
#+selected - integer: identifes the selected patron
#
def edit_patron_email_address(selected)
	p = Patron.find(selected)
	print "To edit the patron email address please enter here: "
	email_address = gets.chomp
	p.update_attributes(email_address: email_address)
end



#remove_patron method removes a patron
#
#+selected - integer: identifies the selected patron
#
def remove_patron(selected)
	p = Patron.find(selected)
	p.destroy
end


#show_books_checked_by_patron method shows the books currently
#    checked out by a patron
#
#+selected - integer: identifes the patron selected
#
def show_books_checked_by_patron(selected)
	p = Patron.find_by_id(selected).books
	if p == []
		puts "\nNo books currently checked out to #{Patron.find_by_id(selected).name}\n"
	else
		puts "\n"
		p.each do |book|
			puts "#{Patron.find_by_id(selected).name} currently has #{book.title} checked out."
		end
	end
end


#select_choice_patron method allows the user to select 
#   a choice from a menu in the patron directory
#
#
#
#returns select
def select_choice_patron
	puts "\n1 Add a Patron\n2 Information on a Patron\n3 Edit a Patron\n4 Remove a Patron\n5 View All Patrons\n6 View All Books a Patron has Checked Out\n0 Return to Main Menu"
	select = make_selection

	while select != "1" && select != "2" && select != "3" && select != "4" && select != "5" && select != "6" && select != "0"
		puts "\nInvalid choice selected\n"		 		
		select = make_selection
	end

	if select == "1"
		add_patron

	elsif select == "2"
		puts "\nTo get information about a patron please enter their ID #\n"
		show_all_patrons
		select = make_selection.to_i
		select = verify_patron_exists(select)
		display_patron(select)

	elsif select == "3"
		puts "\nTo edit a patron please enter their ID #\n"
		show_all_patrons
		select = make_selection.to_i
		select = verify_patron_exists(select)
		edit_patron(select)

	elsif select == "4"
		puts "\nTo remove a patron please enter their ID #\n"
		show_all_patrons
		select = make_selection.to_i
		select = verify_patron_exists(select)
		remove_patron(select)

	elsif select == "5"
		show_all_patrons

	elsif select == "6"
		puts "\nTo see what books a patron has checked out please enter their ID #\n"
		show_all_patrons
		select = make_selection.to_i
		select = verify_patron_exists(select)
		show_books_checked_by_patron(select)

	elsif select == "0"
		puts "\nNow entering main menu\n"

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

	while select != "1" && select != "2" && select != "3" && select != "4" && select != "0"
		puts "\nInvalid choice selected\n"		 		
		select = make_selection
	end

	if select == "1"
		library_choice = "9"
		while library_choice != "0"
			library_choice = select_choice_library
		end

 	elsif select == "2"
# 	staff member


	elsif select == "3"
		book_choice = "9"
		while book_choice != "0"
			book_choice = select_choice_book
		end


	elsif select == "4"
		patron_choice = "9"
		while patron_choice != "0"
			patron_choice = select_choice_patron
		end


	elsif select == "0"
		puts "\nGoodbye"		 		
	end
	select 
end


def main
	puts "\nWelcome to the Library Interface\n"
	puts "\nWhat would you like to do?\n"

	choice = "9"

	while choice != "0"
		choice = main_menu
	end	
end

main 
#binding.pry	
 





