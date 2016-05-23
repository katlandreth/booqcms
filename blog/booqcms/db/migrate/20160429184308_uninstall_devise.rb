class UninstallDevise < ActiveRecord::Migration
  def change
    drop_table :booqcms_users
  end
end
