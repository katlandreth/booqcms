class CreateBooqcmsTaggings < ActiveRecord::Migration
  def change
    create_table :booqcms_taggings do |t|
      t.belongs_to :booqcms_entry, index: true, foreign_key: true
      t.belongs_to :booqcms_tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
