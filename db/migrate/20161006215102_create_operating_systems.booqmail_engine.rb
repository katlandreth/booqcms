# This migration comes from booqmail_engine (originally 20160811195835)
class CreateOperatingSystems < ActiveRecord::Migration
  def change
    create_table :operating_systems do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
