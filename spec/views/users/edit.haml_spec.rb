require File.dirname(__FILE__) + '/../../spec_helper'

describe "/User/edit.haml" do
  include UsersHelper
  
  before do
    @user = mock_model(User)
    @user.stub!(:username).and_return("MyString")
    @user.stub!(:email).and_return("MyString")
    @user.stub!(:password).and_return("MyString")
    assigns[:user] = @user
  end

  it "should render edit form" do
    render "/Users/edit.haml"
    
    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_username[name=?]', "user[username]")
      with_tag('input#user_email[name=?]', "user[email]")
      with_tag('input#user_password[name=?]', "user[password]")
    end
  end
end