# This migration comes from booqcms (originally 20160520162054)
class AddContentTypeColumn < ActiveRecord::Migration
  def change
    add_column :booqcms_entries, :content_format, :string
  end
end
