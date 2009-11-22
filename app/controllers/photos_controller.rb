class PhotosController < ApplicationController
  # GET /photo
  # GET /photo.xml
  def index
    @photos = Photo.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @photos }
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

  # POST /photo
  # POST /photo.xml
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo was successfully created.'
        format.html { redirect_to(photo_path(@photo)) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
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
      format.xml  { head :ok }
    end
  end
end
