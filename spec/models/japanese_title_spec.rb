describe JapaneseTitle do
  before(:all) do
    JapaneseTitle.create(:eng_title => "English Title", :jp_title => "Japanese Title")
  end

  describe ".translate_title" do
    it "uses the correct title for the current locale" do
      I18n.locale = :en
      JapaneseTitle.translate_title("English Title").should eq("English Title")
      I18n.locale = :jp
      JapaneseTitle.translate_title("English Title").should eq("Japanese Title")
    end
  end
end
