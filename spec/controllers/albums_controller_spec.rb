require File.dirname(__FILE__) + '/../spec_helper'

describe AlbumsController, "#route_for" do

  it "should map { :controller => 'Albums', :action => 'index' } to /albums" do
    route_for(:controller => "Albums", :action => "index").should == "/albums"
  end
  
  it "should map { :controller => 'Albums', :action => 'new' } to /albums/new" do
    route_for(:controller => "Albums", :action => "new").should == "/albums/new"
  end
  
  it "should map { :controller => 'Albums', :action => 'show', :id => 1 } to /albums/1" do
    route_for(:controller => "Albums", :action => "show", :id => 1).should == "/albums/1"
  end
  
  it "should map { :controller => 'Albums', :action => 'edit', :id => 1 } to /albums/1/edit" do
    route_for(:controller => "Albums", :action => "edit", :id => 1).should == "/albums/1/edit"
  end
  
  it "should map { :controller => 'Albums', :action => 'update', :id => 1} to /albums/1" do
    route_for(:controller => "Albums", :action => "update", :id => 1).should == "/albums/1"
  end
  
  it "should map { :controller => 'Albums', :action => 'destroy', :id => 1} to /albums/1" do
    route_for(:controller => "Albums", :action => "destroy", :id => 1).should == "/albums/1"
  end
  
end

describe AlbumsController, "handling GET /albums" do

  before do
    @album = mock_model(Album)
    Album.stub!(:find).and_return([@album])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all Albums" do
    Album.should_receive(:find).with(:all).and_return([@album])
    do_get
  end
  
  it "should assign the found Albums for the view" do
    do_get
    assigns[:albums].should == [@album]
  end
end

describe AlbumsController, "handling GET /albums.xml" do

  before do
    @album = mock_model(Album, :to_xml => "XML")
    Album.stub!(:find).and_return(@album)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all Albums" do
    Album.should_receive(:find).with(:all).and_return([@album])
    do_get
  end
  
  it "should render the found Album as xml" do
    @album.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe AlbumsController, "handling GET /albums/1" do

  before do
    @album = mock_model(Album)
    Album.stub!(:find).and_return(@album)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the album requested" do
    Album.should_receive(:find).with("1").and_return(@album)
    do_get
  end
  
  it "should assign the found album for the view" do
    do_get
    assigns[:album].should equal(@album)
  end
end

describe AlbumsController, "handling GET /albums/1.xml" do

  before do
    @album = mock_model(Album, :to_xml => "XML")
    Album.stub!(:find).and_return(@album)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the album requested" do
    Album.should_receive(:find).with("1").and_return(@album)
    do_get
  end
  
  it "should render the found album as xml" do
    @album.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe AlbumsController, "handling GET /albums/new" do

  before do
    @album = mock_model(Album)
    Album.stub!(:new).and_return(@album)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new album" do
    Album.should_receive(:new).and_return(@album)
    do_get
  end
  
  it "should not save the new album" do
    @album.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new album for the view" do
    do_get
    assigns[:album].should equal(@album)
  end
end

describe AlbumsController, "handling GET /albums/1/edit" do

  before do
    @album = mock_model(Album)
    Album.stub!(:find).and_return(@album)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the album requested" do
    Album.should_receive(:find).and_return(@album)
    do_get
  end
  
  it "should assign the found album for the view" do
    do_get
    assigns[:album].should equal(@album)
  end
end

describe AlbumsController, "handling POST /albums" do

  before do
    @album = mock_model(Album, :to_param => "1")
    Album.stub!(:new).and_return(@album)
  end
  
  def post_with_successful_save
    @album.should_receive(:save).and_return(true)
    post :create, :album => {}
  end
  
  def post_with_failed_save
    @album.should_receive(:save).and_return(false)
    post :create, :album => {}
  end
  
  it "should create a new album" do
    Album.should_receive(:new).with({}).and_return(@album)
    post_with_successful_save
  end

  it "should redirect to the new album on successful save" do
    post_with_successful_save
    response.should redirect_to(album_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe AlbumsController, "handling PUT /albums/1" do

  before do
    @album = mock_model(Album, :to_param => "1")
    Album.stub!(:find).and_return(@album)
  end
  
  def put_with_successful_update
    @album.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @album.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the album requested" do
    Album.should_receive(:find).with("1").and_return(@album)
    put_with_successful_update
  end

  it "should update the found album" do
    put_with_successful_update
    assigns(:album).should equal(@album)
  end

  it "should assign the found album for the view" do
    put_with_successful_update
    assigns(:album).should equal(@album)
  end

  it "should redirect to the album on successful update" do
    put_with_successful_update
    response.should redirect_to(album_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe AlbumsController, "handling DELETE /Album/1" do

  before do
    @album = mock_model(Album, :destroy => true)
    Album.stub!(:find).and_return(@album)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the album requested" do
    Album.should_receive(:find).with("1").and_return(@album)
    do_delete
  end
  
  it "should call destroy on the found album" do
    @album.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the Albums list" do
    do_delete
    response.should redirect_to(albums_url)
  end
end
