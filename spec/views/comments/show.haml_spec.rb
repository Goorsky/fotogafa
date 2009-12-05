require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Comments/show.haml" do
  include CommentsHelper
  
  before do
    @comment = mock_model(Comment)
    @comment.stub!(:user_id).and_return("1")
    @comment.stub!(:text).and_return("MyText")

    assigns[:comment] = @comment
  end

  it "should render attributes in <p>" do
    render "/Comments/show.haml"
    response.should have_text(/MyText/)
  end
end

