class ChangeCategoryName < ActiveRecord::Migration
  def change
    rename_column :booqcms_entries, :category, :type
  end
end
