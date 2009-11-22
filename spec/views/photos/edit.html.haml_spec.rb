require File.dirname(__FILE__) + '/../../spec_helper'

describe "/photo/edit.html.haml" do
  include PhotosHelper
  
  before do
    @photo = mock_model(Photo)
    @photo.stub!(:title).and_return("MyString")
    @photo.stub!(:album_id).and_return("1")
    @photo.stub!(:user_id).and_return("1")
    assigns[:photo] = @photo
  end

  it "should render edit form" do
    render "/photos/edit.html.haml"
    
    response.should have_tag("form[action=#{photo_path(@photo)}][method=post]") do
      with_tag('input#photo_title[name=?]', "photo[title]")
    end
  end
end