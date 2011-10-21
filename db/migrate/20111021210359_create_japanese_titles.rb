class CreateJapaneseTitles < ActiveRecord::Migration
  def change
    create_table :japanese_titles do |t|
      t.string :eng_title
      t.string :jp_title

      t.timestamps
    end
  end
end
