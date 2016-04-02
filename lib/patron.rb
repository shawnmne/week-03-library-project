#this is a class that create a patron object
#
#+name - string: name of the patron
#+email_address - string: email address of the patron

class Patron < ActiveRecord::Base

	validates :name, presence: true
	validates :email_address, presence: true

	has_many :books



end