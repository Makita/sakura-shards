class CreateLightNovels < ActiveRecord::Migration
  def change
    create_table :light_novels do |t|
      t.string :name
      t.integer :volume
      t.integer :chapter

      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
