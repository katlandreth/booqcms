class AddContentTypeColumn < ActiveRecord::Migration
  def change
    add_column :dashboard_entries, :content_format, :string
  end
end
