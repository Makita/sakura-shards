describe Announcement do
  it "has many comments" do
    announcement = Factory(:announcement)
    Factory.build :comment, :announcement_id => announcement.id
    Announcement.find(announcement.id).comments.should eq(Comment.where(:announcement_id => announcement.id))
  end

  describe ".get_announcements" do
    it "gets the last 10 announcements" do
      announcements = []
      10.times { Factory(:announcement) }
      announcements = Announcement.find(:all, :limit => 10, :order => 'id DESC')
      announcements.should eq(Announcement.get_announcements)
    end
  end
end
