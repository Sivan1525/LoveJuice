class HomeController < ApplicationController
  before_filter :comment_collection

  def index
    @photos = Photo.search(params[:q])
  end

  def upload_image
  	@image = Photo.new(params[:photo])
  	@image.save
  	redirect_to root_url,:notice=>"Photo is succesfully added."
  end

  def show_image
  	@photo = Photo.find(params[:id])
    @comment  = ItemComment.new
  	render :partial=>"show_image",:layout=>false
  end

  def like_image
    @photo = Photo.find(params[:id])
    like = ItemLike.create(:user_id=>current_user.id,:item_id=>params[:id],:item_type=>"Photo")
    respond_to do |format|
      format.js
    end
  end

  def add_comment
     @comment = ItemComment.new(params[:item_comment])
    if @comment.save
      notice = "Successfully Commented"
    else
      notice = "Comment is not updated"
    end
    redirect_to root_url,:notice=>notice
  end

  def accept_repin
    @photo = Photo.find(params[:id])
    @repin_photo = Photo.new(:repin_id =>@photo.id,:user_id => current_user.id)
    @repin_photo.image = @photo.image
    message,counted = @repin_photo.save ? ["Repinned succesfully",@photo.increment_repin_count!] : "Already repinned" 
    if (params[:from_popup] == "true")
      redirect_to user_profile_home_index_path
    else
      redirect_to root_url,:notice=> message
    end
  end

  def user_profile
    @profile_photo = current_user.photos
  end

  private

  def comment_collection
    if user_signed_in?
      @image = Photo.new
    else  
      @resource = User.new
    end

    @comment  = ItemComment.new
    
  end
end
