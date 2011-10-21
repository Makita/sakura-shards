class Announcement < ActiveRecord::Base
  has_many :comments

  def self.get_announcements
    return self.find(:all, :order => 'id desc', :limit => 10)
  end
end
