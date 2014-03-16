class CreateProductClasses < ActiveRecord::Migration
  def change
    create_table :product_classes do |t|
      t.string :name
      t.string :abbr
      t.string :img_ref

      t.timestamps
    end
  end
end
