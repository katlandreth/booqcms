# This migration comes from dashboard (originally 20160512205938)
class ChangeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :dashboard_entries, :type, :post_type
  end
end
