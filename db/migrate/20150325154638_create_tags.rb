class CreateTags < ActiveRecord::Migration
	def change
		create_table :tags do |t|
			t.column :tag_name, :string, limit: 64
			t.timestamps null: false
		end
	end
end