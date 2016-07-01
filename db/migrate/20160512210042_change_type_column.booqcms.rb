# This migration comes from dashboard (originally 20160512205938)
class ChangeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :booqcms_entries, :type, :post_type
  end
end
