class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :name
      t.string :type
      t.integer :size, :limit => 8
      t.string :intptlat
      t.string :intptlon

      t.timestamps
    end
    add_reference :counties, :state, index: true
  end
end
