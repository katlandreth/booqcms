class CreateDashboardTaggings < ActiveRecord::Migration
  def change
    create_table :dashboard_taggings do |t|
      t.integer :dashboard_entry, index: true, foreign_key: true
      t.integer :dashboard_tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
