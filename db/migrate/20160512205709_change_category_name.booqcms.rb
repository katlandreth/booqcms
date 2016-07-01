# This migration comes from dashboard (originally 20160512205305)
class ChangeCategoryName < ActiveRecord::Migration
  def change
    rename_column :booqcms_entries, :category, :type
  end
end
