require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Comments/new.haml" do
  include CommentsHelper
  
  before do
    @comment = mock_model(Comment)
    @comment.stub!(:new_record?).and_return(true)
    @comment.stub!(:user_id).and_return("1")
    @comment.stub!(:text).and_return("MyText")
    assigns[:comment] = @comment
  end

  it "should render new form" do
    render "/Comments/new.haml"
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("textarea#comment_text[name=?]", "comment[text]")
    end
  end
end
