# This migration comes from dashboard (originally 20160421181413)
class AddFeaturedImageColumnToEntries < ActiveRecord::Migration
  def change
    add_column :dashboard_entries, :featured_image, :string
  end
end
