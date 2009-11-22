require File.dirname(__FILE__) + '/../../spec_helper'

describe "/photos/new.html.haml" do
  include PhotosHelper
  
  before do
    @photo = mock_model(Photo)
    @photo.stub!(:new_record?).and_return(true)
    @photo.stub!(:title).and_return("MyString")
    @photo.stub!(:album_id).and_return("1")
    @photo.stub!(:user_id).and_return("1")
    assigns[:photo] = @photo
  end

  it "should render new form" do
    render "/photos/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", photos_path) do
      with_tag("input#photo_title[name=?]", "photo[title]")
    end
  end
end
