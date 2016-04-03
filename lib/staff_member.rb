#this is a class that creates a staff_member object
#
#+name - string: name of the staff member
#+email_address - string: email of the staff member
#+libray_id - integer: primary key of a library 

class StaffMember < ActiveRecord::Base

	validates :name, presence: true
	validates :email_address, presence: true
	validates :library_id, presence: true

	belongs_to :library



end