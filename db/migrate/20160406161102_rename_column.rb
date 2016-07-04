class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :dashboard_entries, :type, :category
  end
end
