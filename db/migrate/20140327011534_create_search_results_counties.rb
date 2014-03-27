class CreateSearchResultsCounties < ActiveRecord::Migration
  def change
    create_table :search_results_counties do |t|
      t.string :county_name
	 t.string :company_name
      t.bigint :num_enrolled
	 t.bigint :num_subscribers
	 t.decimal :subscriber_pct
      t.bigint :total_market
	 t.bigint :available_market
	 t.bigint :num_insured
	 t.decimal :market_penetration
      t.decimal :enrolled_pct
	 t.decimal :subscriber_pct
      t.bigint :num_pcp
	 t.decimal :pcp_pct
      t.bigint :num_specialists
	 t.decimal :specialists_pct
      t.bigint :num_facilities
	 t.decimal :facilities_pct
      t.integer :company_rank
	 t.integer :county_rank
	 t.integer :num_plans
	 t.integer :num_plan_types
	 t.bigint :competition_index
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
