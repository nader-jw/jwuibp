require File.join(File.dirname(__FILE__), "../spec_helper.rb")

describe "Demo App", :type => :feature do
  it "should show demo page" do
    visit '/'
    page.should have_content 'Sample App Placeholder'
  end
end