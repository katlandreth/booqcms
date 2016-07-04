class AddFeaturedImageColumnToEntries < ActiveRecord::Migration
  def change
    add_column :dashboard_entries, :featured_image, :string
  end
end
