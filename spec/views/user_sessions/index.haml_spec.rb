require File.dirname(__FILE__) + '/../../spec_helper'

describe "/user_sessions/index.haml" do
  include UserSessionsHelper
  
  before do
    user_session_98 = mock_model(User_session)
    user_session_98.should_receive(:username).and_return("MyString")
    user_session_98.should_receive(:password).and_return("MyString")
    user_session_99 = mock_model(User_session)
    user_session_99.should_receive(:username).and_return("MyString")
    user_session_99.should_receive(:password).and_return("MyString")

    assigns[:user_sessions] = [user_session_98, user_session_99]
  end

  it "should render list of user_sessions" do
    render "/user_sessions/index.haml"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end
