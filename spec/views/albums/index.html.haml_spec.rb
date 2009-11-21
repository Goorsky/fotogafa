require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Albums/index.html.haml" do
  include AlbumsHelper
  
  before do
    album_98 = mock_model(Album)
    album_98.should_receive(:parent_id).and_return("1")
    album_98.should_receive(:title).and_return("MyString")
    album_98.should_receive(:description).and_return("MyText")
    album_99 = mock_model(Album)
    album_99.should_receive(:parent_id).and_return("1")
    album_99.should_receive(:title).and_return("MyString")
    album_99.should_receive(:description).and_return("MyText")

    assigns[:albums] = [album_98, album_99]
  end

  it "should render list of albums" do
    render "/Albums/index.html.haml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end
