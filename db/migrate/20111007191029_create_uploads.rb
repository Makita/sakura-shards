class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name
      t.integer :volume
      t.integer :chapter

      t.timestamps
    end
  end
end
