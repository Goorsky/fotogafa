require File.dirname(__FILE__) + '/../../spec_helper'

describe "/user_sessions/show.haml" do
  include UserSessionsHelper
  
  before do
    @user_session = mock_model(UserSession)
    @user_session.stub!(:username).and_return("MyString")
    @user_session.stub!(:password).and_return("MyString")

    assigns[:user_session] = @user_session
  end

  it "should render attributes in <p>" do
    render "/user_sessions/show.haml"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

