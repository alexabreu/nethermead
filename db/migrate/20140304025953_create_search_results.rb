class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.string :company_name
      t.string :state_name
      t.string :product_class

      t.timestamps
    end
  end
end
