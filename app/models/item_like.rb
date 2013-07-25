class ItemLike < ActiveRecord::Base
  attr_accessible :item_id, :item_type, :user_id

  belongs_to :user
  
  belongs_to :item, polymorphic: true

  validates_uniqueness_of :user_id , :scope => [:item_id, :item_type]
end
