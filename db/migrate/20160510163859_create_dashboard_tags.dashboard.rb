# This migration comes from dashboard (originally 20160510152013)
class CreateDashboardTags < ActiveRecord::Migration
  def change
    create_table :dashboard_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
