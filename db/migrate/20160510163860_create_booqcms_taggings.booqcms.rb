# This migration comes from dashboard (originally 20160510152140)
class CreateBooqcmsTaggings < ActiveRecord::Migration
  def change
    create_table :booqcms_taggings do |t|
      t.integer :booqcms_entry, index: true, foreign_key: true
      t.integer :booqcms_tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
