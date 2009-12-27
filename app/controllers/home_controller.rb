class HomeController < ApplicationController

  def index
    respond_to do |format|
      format.html # index.haml
      #format.xml  { render :xml => @photos }
    end
  end
    
end
