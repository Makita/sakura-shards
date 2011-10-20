class JapaneseVersion < ActiveRecord::Base
  def self.get_announcements
    return self.find(:all, :order => 'announcements_id DESC', :limit => 10)
  end
end
