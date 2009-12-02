require File.dirname(__FILE__) + '/../../spec_helper'

describe "/user_sessions/new.haml" do
  include UserSessionsHelper
  
  before do
    @user_session = mock_model(UserSession)
    @user_session.stub!(:new_record?).and_return(true)
    @user_session.stub!(:username).and_return("MyString")
    @user_session.stub!(:password).and_return("MyString")
    assigns[:user_session] = @user_session
  end

  it "should render new form" do
    render "/user_sessions/new.haml"
    
    response.should have_tag("form[action=?][method=post]", user_sessions_path) do
      with_tag("input#user_session_username[name=?]", "user_session[username]")
      with_tag("input#user_session_password[name=?]", "user_session[password]")
    end
  end
end
