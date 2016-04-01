#this is a class that creates a library object

#+branch_name - string: name of the library
#+address - string: address of the library
#+phone - string: phone # of library

class Library < ActiveRecord::Base

	validates :branch_name, presence: true
	validates :address, presence: true
	validates :phone, presence: true

	has_many :staff_members
	has_many :books


end