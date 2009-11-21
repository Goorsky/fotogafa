class AlbumsController < ApplicationController
  # GET /Album
  # GET /Album.xml
  def index
    @albums = Album.find(:all)

    respond_to do |format|
      format.html # index.haml
      format.xml  { render :xml => @albums }
    end
  end

  # GET /Album/1
  # GET /Album/1.xml
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.haml
      format.xml  { render :xml => @album }
    end
  end

  # GET /Album/new
  # GET /Album/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.haml
      format.xml  { render :xml => @album }
    end
  end

  # GET /Album/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /Album
  # POST /Album.xml
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to(album_path(@album)) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Album/1
  # PUT /Album/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to(album_path(@album)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Album/1
  # DELETE /Album/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(albums_url) }
      format.xml  { head :ok }
    end
  end
end
