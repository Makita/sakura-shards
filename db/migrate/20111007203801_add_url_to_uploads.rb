class AddUrlToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :url, :string
  end
end
