class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :booqcms_entries, :type, :category
  end
end
