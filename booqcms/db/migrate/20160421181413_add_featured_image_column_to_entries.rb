class AddFeaturedImageColumnToEntries < ActiveRecord::Migration
  def change
    add_column :booqcms_entries, :featured_image, :string
  end
end
