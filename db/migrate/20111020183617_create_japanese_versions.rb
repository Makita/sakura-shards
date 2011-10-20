class CreateJapaneseVersions < ActiveRecord::Migration
  def change
    create_table :japanese_versions do |t|
      t.string :title
      t.text :body
      t.string :author
      t.references :announcements

      t.timestamps
    end
  end
end
