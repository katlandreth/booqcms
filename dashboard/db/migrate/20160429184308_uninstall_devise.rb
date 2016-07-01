class UninstallDevise < ActiveRecord::Migration
  def change
    drop_table :dashboard_users
  end
end
