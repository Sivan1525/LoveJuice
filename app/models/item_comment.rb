class ItemComment < ActiveRecord::Base
  attr_accessible :description, :item_id, :item_type, :user_id
  belongs_to :item, polymorphic: true
  belongs_to :user
  validates_presence_of :user_id
end
