class ChangePayloadData < ActiveRecord::Migration
  def self.up
    change_column :booqcms_entries, :payload, :text
  end

  def self.down
    change_column :booqcms_entries, :payload, :json
  end
end
