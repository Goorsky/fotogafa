require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Albums/new.html.haml" do
  include AlbumsHelper
  
  before do
    @album = mock_model(Album)
    @album.stub!(:new_record?).and_return(true)
    @album.stub!(:parent_id).and_return("1")
    @album.stub!(:title).and_return("MyString")
    @album.stub!(:description).and_return("MyText")
    assigns[:album] = @album
  end

  it "should render new form" do
    render "/Albums/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", albums_path) do
      with_tag("input#album_title[name=?]", "album[title]")
      with_tag("textarea#album_description[name=?]", "album[description]")
    end
  end
end
