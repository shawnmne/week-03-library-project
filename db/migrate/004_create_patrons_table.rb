class CreatePatronsTable < ActiveRecord::Migration
	def change
		create_table :patrons do |t|
			t.string :name
			t.string :email_address
		end
	end
end
