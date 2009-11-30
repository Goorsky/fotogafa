class WaitingPhotosController < ApplicationController

  def index
    @photos = Photo.find_all_by_status(0)

    respond_to do |format|
      format.html # index.haml
      #format.xml  { render :xml => @photos }
    end
  end
    
end
