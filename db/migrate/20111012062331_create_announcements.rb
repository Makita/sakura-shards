class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
