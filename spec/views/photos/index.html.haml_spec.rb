require File.dirname(__FILE__) + '/../../spec_helper'

describe "/photos/index.html.haml" do
  include PhotosHelper
  
  before do
    photo_98 = mock_model(Photo)
    photo_98.should_receive(:title).and_return("MyString")
    photo_98.should_receive(:album_id).and_return("1")
    photo_98.should_receive(:user_id).and_return("1")
    photo_99 = mock_model(Photo)
    photo_99.should_receive(:title).and_return("MyString")
    photo_99.should_receive(:album_id).and_return("1")
    photo_99.should_receive(:user_id).and_return("1")

    assigns[:photos] = [photo_98, photo_99]
  end

  it "should render list of photos" do
    render "/photos/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
  end
end
