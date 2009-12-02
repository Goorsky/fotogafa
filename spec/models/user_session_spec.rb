require File.dirname(__FILE__) + '/../spec_helper'

describe UserSession do
  before(:each) do
    @user_session = UserSession.new
  end

  it "should be valid" do
    @user_session.should be_valid
  end
end
