class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :user_id,:defualt=>0
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
