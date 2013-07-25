class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.integer :item_id
      t.string :item_type
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
