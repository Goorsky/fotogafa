class AcceptPhotoController < ApplicationController

  def index
    Photo.find_by_id(params[:id]).accept!
    
    respond_to do |format|
      format.js {render :action => "accept"}
    end
  end  

end