class Photo < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :title, :user_id,:image

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/system/:class/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension"

  belongs_to :user
  has_many :item_likes,:as=>:item
  has_many :item_comments,:as=>:item


  def self.search(query)
  	if query.blank?
  		self.all
  	else
  		Photo.where("image_file_name like ?","%#{query}%")
  	end
  end
end
