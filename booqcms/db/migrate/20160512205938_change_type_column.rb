class ChangeTypeColumn < ActiveRecord::Migration
  def change
    rename_column :booqcms_entries, :type, :post_type
  end
end
