require File.dirname(__FILE__) + '/../spec_helper'

describe Album do
  before(:each) do
    @album = Album.new
  end

  it "should be valid" do
    @album.should be_valid
  end
end
