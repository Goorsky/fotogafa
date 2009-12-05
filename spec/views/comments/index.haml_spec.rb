require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Comments/index.haml" do
  include CommentsHelper
  
  before do
    comment_98 = mock_model(Comment)
    comment_98.should_receive(:user_id).and_return("1")
    comment_98.should_receive(:text).and_return("MyText")
    comment_99 = mock_model(Comment)
    comment_99.should_receive(:user_id).and_return("1")
    comment_99.should_receive(:text).and_return("MyText")

    assigns[:comments] = [comment_98, comment_99]
  end

  it "should render list of comments" do
    render "/Comments/index.haml"
    response.should have_tag("tr>td", "MyText", 2)
  end
end
