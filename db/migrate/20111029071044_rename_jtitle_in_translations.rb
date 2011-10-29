class RenameJtitleInTranslations < ActiveRecord::Migration
  def change
    rename_column :translations, :jtitle, :japanese_title
  end
end
