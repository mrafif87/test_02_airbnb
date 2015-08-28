class CreateUsersProperties < ActiveRecord::Migration
  def change
    create_table :user_properties do |t|
      t.integer :property_id
      t.integer :user_id
    end
  end
end
