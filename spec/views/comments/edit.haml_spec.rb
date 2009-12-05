require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Comment/edit.haml" do
  include CommentsHelper
  
  before do
    @comment = mock_model(Comment)
    @comment.stub!(:user_id).and_return("1")
    @comment.stub!(:text).and_return("MyText")
    assigns[:comment] = @comment
  end

  it "should render edit form" do
    render "/Comments/edit.haml"
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('textarea#comment_text[name=?]', "comment[text]")
    end
  end
end