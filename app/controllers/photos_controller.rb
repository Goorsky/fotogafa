class PhotosController < ApplicationController

protect_from_forgery :except => :create

  # GET /photo
  # GET /photo.xml
  def index
    @photos = Photo.find_all_by_status(1)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @photos }
      format.png
    end
  end

  # GET /photo/1
  # GET /photo/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.png
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photo/new
  # GET /photo/new.xml
  def new
    @photo = Photo.new
    @albums = Album.find(:all)

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photo/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @albums = Album.find(:all) 
    # SWFUpload file
    if params[:Filedata]
      @photo = Photo.new(:swfupload_file => params[:Filedata])
      @photo.album_id = params[:album_id]
      #@photo = Photo.new
      #@photo.image_file = params[:Filedata]      
      if @photo.save
        render :text => "OK"
      else
        render :text => "Nie mogłem dodać zdjęcia."
      end
    else
      # Standard upload
      @photo = Photo.new params[:photo]
      if @photo.save
        flash[:notice] = 'Your photo has been uploaded!'
        redirect_to photos_path
      else
        render :action => :new
      end
    end
  end

  # PUT /photo/1
  # PUT /photo/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to(photo_path(@photo)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photo/1
  # DELETE /photo/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.js
      format.xml  { head :ok }
    end
  end
end
