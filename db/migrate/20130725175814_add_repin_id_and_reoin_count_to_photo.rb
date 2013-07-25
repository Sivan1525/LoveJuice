class AddRepinIdAndReoinCountToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :repin_id, :integer 
    add_column :photos, :repin_count, :integer, :default => 0
  end
end
