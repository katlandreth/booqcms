# This migration comes from booqcms (originally 20160520171149)
class AddDraftsmanColumnsToEntries < ActiveRecord::Migration
  def change
    add_column :booqcms_entries, :draft_id, :integer
    add_column :booqcms_entries, :trashed_at, :timestamp
  end

  def up
    change_column :booqcms_entries, :published_at, :datetime
  end

  def down
    change_column :booqcms_entries, :published_at, :timestamp
  end
end
