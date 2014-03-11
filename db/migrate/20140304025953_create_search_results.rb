class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.string	:company_name
      t.string	:state_name
      t.string	:product_class
      t.integer :num_enrollee_in_state
      t.integer :num_enrollee_in_state_w_company
      t.integer :num_enrollee_in_county
      t.decimal :share_company_in_state
      t.integer :num_company_in_state
      t.integer :num_company_in_county
      t.integer :num_company_plan_in_county
      t.integer :num_plantype_in_county
      t.integer :reportyear
      t.string	:county
      
      
      t.timestamps
    end
  end
end
