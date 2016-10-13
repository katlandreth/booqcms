class DropBooqcmsTables < ActiveRecord::Migration
  def up
    drop_table :booqcms_entries
    drop_table :booqcms_users
    drop_table :booqcms_tags
    drop_table :booqcms_taggings
    drop_table :booqcms_media
  end

  def down
    create_table :booqcms_entries
    create_table :booqcms_users
    create_table :booqcms_tags
    create_table :booqcms_taggings
    create_table :booqcms_media
  end
end
