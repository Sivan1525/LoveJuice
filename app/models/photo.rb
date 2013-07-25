class Photo < ActiveRecord::Base
  attr_accessible :image_content_type, :image_file_name, :image_file_size, :image_updated_at, :title, :user_id,:image,:repin_id,:repin_count

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/system/:class/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension"

  belongs_to :user
  has_many :item_likes,:as=>:item
  has_many :item_comments,:as=>:item
  validates_uniqueness_of :repin_id,:scope => :user_id, :if => Proc.new{|p| !p.repin_id.blank?}


  def self.search(query)
  	if query.blank?
  		self.all
  	else
  		Photo.where("image_file_name like ?","%#{query}%")
  	end
  end

  def increment_repin_count!
    self.repin_count += 1
    self.save
  end
  def already_repinned(user)
    Photo.find_by_user_id_and_repin_id(user,self).blank?
  end
end
 