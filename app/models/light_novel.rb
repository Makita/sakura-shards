class LightNovel < ActiveRecord::Base
  def self.get_latest
    self.find(:all, :order => 'id desc', :limit => 10)
  end
end
