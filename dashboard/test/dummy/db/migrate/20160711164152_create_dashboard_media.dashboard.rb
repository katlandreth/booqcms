# This migration comes from dashboard (originally 20160408205616)
class CreateDashboardMedia < ActiveRecord::Migration
  def change
    create_table :dashboard_media do |t|
      t.string :title
      t.text :description
      t.string :file

      t.timestamps null: false
    end
  end
end
