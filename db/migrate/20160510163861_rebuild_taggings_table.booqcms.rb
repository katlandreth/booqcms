# This migration comes from dashboard (originally 20160510161418)
class RebuildTaggingsTable < ActiveRecord::Migration
  def up
    drop_table :booqcms_taggings
  end

  def down
  end
end
