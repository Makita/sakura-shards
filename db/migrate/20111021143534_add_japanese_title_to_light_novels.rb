class AddJapaneseTitleToLightNovels < ActiveRecord::Migration
  def change
    add_column :light_novels, :japanese_title, :string, :after => :title
  end
end
