class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :name
      t.integer :volume
      t.integer :chapter

      t.string :title
      t.string :jtitle
      t.text :body

      t.timestamps
    end
  end
end
