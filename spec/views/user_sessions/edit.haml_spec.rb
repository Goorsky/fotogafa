require File.dirname(__FILE__) + '/../../spec_helper'

describe "/user_session/edit.haml" do
  include UserSessionsHelper
  
  before do
    @user_session = mock_model(User_session)
    @user_session.stub!(:username).and_return("MyString")
    @user_session.stub!(:password).and_return("MyString")
    assigns[:user_session] = @user_session
  end

  it "should render edit form" do
    render "/user_sessions/edit.haml"
    
    response.should have_tag("form[action=#{user_session_path(@user_session)}][method=post]") do
      with_tag('input#user_session_username[name=?]', "user_session[username]")
      with_tag('input#user_session_password[name=?]', "user_session[password]")
    end
  end
end