# This migration comes from dashboard (originally 20160323162931)
class CreateBooqcmsEntries < ActiveRecord::Migration
  def change
    create_table :booqcms_entries do |t|
      t.string :type, index: true
      t.string :title
      t.string :slug, index: true
      t.json :payload
      t.integer :user_id, index: true
      t.string :author_name

      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
