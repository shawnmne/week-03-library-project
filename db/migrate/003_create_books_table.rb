class CreateBooksTable < ActiveRecord::Migration
	def change
		create_table :books do |t|
			t.string :title 
			t.string :author
			t.string :isbn
			t.integer :library_id
			t.integer :patron_id
		end
	end
end
