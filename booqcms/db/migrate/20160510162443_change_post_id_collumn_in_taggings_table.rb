class ChangePostIdCollumnInTaggingsTable < ActiveRecord::Migration
  def change
    change_table :booqcms_taggings do |t|
      t.remove :post_id
      t.integer :entry_id, index: true, foreign_key: true
    end
  end
end
