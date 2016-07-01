class ChangeCategoryName < ActiveRecord::Migration
  def change
    rename_column :dashboard_entries, :category, :type
  end
end
