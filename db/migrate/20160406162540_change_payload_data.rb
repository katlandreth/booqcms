class ChangePayloadData < ActiveRecord::Migration
  def self.up
    change_column :dashboard_entries, :payload, :text
  end

  def self.down
    change_column :dashboard_entries, :payload, :json
  end
end
