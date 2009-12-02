require File.dirname(__FILE__) + '/../../spec_helper'

describe "/Users/show.haml" do
  include UsersHelper
  
  before do
    @user = mock_model(User)
    @user.stub!(:username).and_return("MyString")
    @user.stub!(:email).and_return("MyString")
    @user.stub!(:password).and_return("MyString")

    assigns[:user] = @user
  end

  it "should render attributes in <p>" do
    render "/Users/show.haml"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

