class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.string :type
      t.string :src_name

      t.timestamps
    end
  end
end
