# This migration comes from booqmail_engine (originally 20160811200000)
class CreateOsVersions < ActiveRecord::Migration
  def change
    create_table :os_versions do |t|
      t.string :name
      t.references :operating_system, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
