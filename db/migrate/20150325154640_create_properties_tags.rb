class CreatePropertiesTags < ActiveRecord::Migration
  def change
    create_table :property_tags do |t|
      t.integer :property_id
      t.integer :tag_id
    end
  end
end
