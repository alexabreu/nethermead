class CreateSearchResultsSegments < ActiveRecord::Migration
  def change
    create_table :search_results_segments do |t|
      t.bigint :size_num
      t.decimal :size_pct
      t.integer :rank_order

      t.timestamps
    end
	add_reference :search_results_segments, :segment, index: true
    	add_reference :search_results_segments, :product_class, index: true
    	add_reference :search_results_segments, :state, index: true
  end
end
