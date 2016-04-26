class ChangePayloadCollumn < ActiveRecord::Migration

  def change
    rename_column :booqcms_entries, :type, :category
  end
  
  def self.up
    change_column :booqcms_entries, :payload, :text
  end

  def self.down
    change_column :booqcms_entries, :payload, :json
  end
end
