class CreateStaffMembersTable < ActiveRecord::Migration
	def change
		create_table :staff_members do |t|
			t.string :name
			t.string :email_address
			t.integer :library_id
		end
	end
end