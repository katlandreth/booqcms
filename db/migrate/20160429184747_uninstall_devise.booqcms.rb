# This migration comes from dashboard (originally 20160429184308)
class UninstallDevise < ActiveRecord::Migration
  def change
    drop_table :booqcms_users
    drop_table :users
  end
end
