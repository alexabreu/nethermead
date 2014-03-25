class AlterSearchResults < ActiveRecord::Migration
  def change
	remove_column :search_results, :num_enrollee_in_state
  	remove_column :search_results, :num_enrollee_in_state_w_company
  	remove_column :search_results, :num_enrollee_in_county
  	remove_column :search_results, :share_company_in_state
  	remove_column :search_results, :num_company_in_state
  	remove_column :search_results, :num_company_in_county
  	remove_column :search_results, :num_company_plan_in_county 
  	remove_column :search_results, :num_plantype_in_county
    	remove_column :search_results, :county 

	add_column :search_results, :state_enrolled, :bigint
  	add_column :search_results, :state_parent_enrolled, :bigint
  	add_column :search_results, :share_company_in_state, :float
  	add_column :search_results, :num_active_competitors, :bigint
  	add_column :search_results, :reportdate, :datetime
  	add_column :search_results, :share_parent_in_state_rank, :bigint
  	add_column :search_results, :available_market, :integer
  	add_column :search_results, :total_market, :integer
  	add_column :search_results, :competition_status, :text
  	add_column :search_results, :share_parent_in_state_ss :float
  	add_column :search_results, :num_similar_plans, :bigint
  	add_column :search_results, :num_op_county, :bigint

  end
end