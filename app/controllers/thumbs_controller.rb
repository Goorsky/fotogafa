class ThumbsController < ActionController::Base

  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.png
      format.xml  { render :xml => @photo }
    end
  end
  
end  