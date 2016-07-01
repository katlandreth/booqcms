class ChangeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :dashboard_entries, :type, :post_type
  end
end
