class JapaneseTitle < ActiveRecord::Base
  def self.translate_title(title)
    I18n.locale == :en ? title : self.where(:eng_title => title).first.jp_title
  end

  def self.get_all
    self.order('eng_title')
  end
end
