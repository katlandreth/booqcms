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
