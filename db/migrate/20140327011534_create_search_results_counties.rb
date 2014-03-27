class CreateSearchResultsCounties < ActiveRecord::Migration
  def change
    create_table :search_results_counties do |t|
      t.string :county_name
	 t.string :company_name
      t.integer :num_enrolled, :limit => 8
	 t.integer :num_subscribers, :limit => 8
	 t.decimal :subscriber_pct
      t.integer :total_market, :limit => 8
	 t.integer :available_market, :limit => 8
	 t.integer :num_insured, :limit => 8
	 t.decimal :market_penetration
      t.decimal :enrolled_pct
	 t.decimal :subscriber_pct
      t.integer :num_pcp, :limit => 8
	 t.decimal :pcp_pct
      t.integer :num_specialists, :limit => 8
	 t.decimal :specialists_pct
      t.integer :num_facilities, :limit => 8
	 t.decimal :facilities_pct
      t.integer :company_rank
	 t.integer :county_rank
	 t.integer :num_plans
	 t.integer :num_plan_types
	 t.integer :competition_index, :limit => 8
	 t.string :competition_status
      t.integer :pricing_pos
      t.integer :benefit_loss_pos
      t.integer :enrollment_pos
      t.integer :revenue_pos
      t.integer :media_availability_pos

      t.timestamps
    end
    	add_reference :search_results_counties, :county, index: true
    	add_reference :search_results_counties, :company, index: true
    	add_reference :search_results_counties, :product_class, index: true
    	add_reference :search_results_counties, :state, index: true
	add_reference :search_results_counties, :search_results, index: true
  end
end
