class CreateItemLikes < ActiveRecord::Migration
  def change
    create_table :item_likes do |t|
      t.integer :item_id
      t.string :item_type
      t.integer :user_id

      t.timestamps
    end
  end
end
