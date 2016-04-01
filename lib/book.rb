#this is class that create a book object
#
#+title - string: title of the book
#+author - string: author of the book
#+isbn - integer: isbn of the book
#+library_id - integer: primary key of the libary
#   where the book is available 
#   will be nil if checked out
#+parton_id - integer:  primary key of the patron
#    who has the book checked out, nil if not checked out

class Book < ActiveRecord::Base

	validates :title, presence: true
	validates :author, presence: true
	validates :isbn, presence: true
	validates :library_id, presence: true

	belongs_to :library 
	belongs_to :patron



end