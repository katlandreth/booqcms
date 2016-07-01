# This migration comes from dashboard (originally 20160510152013)
class CreateBooqcmsTags < ActiveRecord::Migration
  def change
    create_table :booqcms_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
