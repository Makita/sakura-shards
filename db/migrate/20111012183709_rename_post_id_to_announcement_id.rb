class RenamePostIdToAnnouncementId < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :announcement_id
  end
end
