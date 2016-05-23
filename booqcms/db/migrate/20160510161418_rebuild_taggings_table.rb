class RebuildTaggingsTable < ActiveRecord::Migration
  def up
    drop_table :booqcms_taggings
  end

  def down
  end
end
