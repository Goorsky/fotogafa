require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Album/edit.html.haml" do
  include AlbumsHelper
  
  before do
    @album = mock_model(Album)
    @album.stub!(:parent_id).and_return("1")
    @album.stub!(:title).and_return("MyString")
    @album.stub!(:description).and_return("MyText")
    assigns[:album] = @album
  end

  it "should render edit form" do
    render "/Albums/edit.html.haml"
    
    response.should have_tag("form[action=#{album_path(@album)}][method=post]") do
      with_tag('input#album_title[name=?]', "album[title]")
      with_tag('textarea#album_description[name=?]', "album[description]")
    end
  end
end