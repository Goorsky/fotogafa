class AcceptPhotoController < ApplicationController

  def index
    @photo = Photo.find_by_id(params[:id])
    @photo.accept!
    
    respond_to do |format|
      format.js {render :action => "accept"}
    end
  end  

end