class MakeNewTaggingsTable < ActiveRecord::Migration
  def change
    create_table :booqcms_taggings do |t|
      t.integer :tag_id, index: true, foreign_key: true
      t.integer :post_id, index: true, foreign_key: true
    end
  end
end
