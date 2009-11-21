require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Albums/show.html.haml" do
  include AlbumsHelper
  
  before do
    @album = mock_model(Album)
    @album.stub!(:parent_id).and_return("1")
    @album.stub!(:title).and_return("MyString")
    @album.stub!(:description).and_return("MyText")

    assigns[:album] = @album
  end

  it "should render attributes in <p>" do
    render "/Albums/show.html.haml"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

