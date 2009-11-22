require File.dirname(__FILE__) + '/../../spec_helper'

describe "/photos/show.html.haml" do
  include PhotosHelper
  
  before do
    @photo = mock_model(Photo)
    @photo.stub!(:title).and_return("MyString")
    @photo.stub!(:album_id).and_return("1")
    @photo.stub!(:user_id).and_return("1")

    assigns[:photo] = @photo
  end

  it "should render attributes in <p>" do
    render "/photos/show.html.haml"
    response.should have_text(/MyString/)
  end
end

