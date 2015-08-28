class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.column :user_id, :integer
			t.column :prop_name, :string
			t.column :prop_details, :string
			t.column :price, :integer
			t.timestamps null: false
		end
	end
end