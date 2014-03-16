class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state_name
      t.string :state_full_name
      t.integer :state_size
      t.string :intptlat
      t.string :intptlon
      t.timestamps
    end
  end
end
