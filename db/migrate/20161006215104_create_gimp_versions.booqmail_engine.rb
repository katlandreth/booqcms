# This migration comes from booqmail_engine (originally 20160930183034)
class CreateGimpVersions < ActiveRecord::Migration
  def change
    create_table :gimp_versions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
