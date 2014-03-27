class CreateSearchResultsCountiesSegments < ActiveRecord::Migration
  def change
    create_table :search_results_counties_segments do |t|
      t.string :county_name
	 t.string :company_name
	 t.string :product_class_name
	 t.string :state_name
	 t.string :segment_name
      t.integer :size_num, :limit => 8
      t.decimal :size_pct
	 t.integer :rank_order

      t.timestamps
    end
    	add_reference :search_results_counties_segments, :segment, index: true
	add_reference :search_results_counties_segments, :product_class, index: true
    	add_reference :search_results_counties_segments, :state, index: true
	add_reference :search_results_counties_segments, :company, index: true
	add_reference :search_results_counties_segments, :search_result, index: true
  end
end
