class RebuildTaggingsTable < ActiveRecord::Migration
  def up
    drop_table :dashboard_taggings
  end

  def down
  end
end
