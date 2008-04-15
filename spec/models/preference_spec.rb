require File.dirname(__FILE__) + '/../spec_helper'

describe Preference do
  before(:each) do
    @preferences = Preference.new
  end

  it "should require email settings for email notifications" do
    @preferences.email_notifications = true
    @preferences.save.should be_false
    @preferences.errors_on(:email_domain).should_not be_empty
    @preferences.errors_on(:smtp_server).should_not be_empty
  end
  
  it "should have a working email_validation boolean" do
    @preferences.should respond_to(:email_validation?) 
  end
end
