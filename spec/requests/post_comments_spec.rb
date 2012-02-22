require 'spec_helper'

describe "PostComments" do
  it "posts a comment" do
    announcement = Factory(:announcement)
    visit "/en/home/comment/#{announcement.id}"
    fill_in "Name", :with => "Tester"
    fill_in "Body", :with => "Testing."
    page.find('.make_comment').click
    page.should have_content("Tester")
    page.should have_content("Testing.")
  end
end
