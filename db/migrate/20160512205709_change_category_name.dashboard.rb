# This migration comes from dashboard (originally 20160512205305)
class ChangeCategoryName < ActiveRecord::Migration
  def change
    rename_column :dashboard_entries, :category, :type
  end
end
