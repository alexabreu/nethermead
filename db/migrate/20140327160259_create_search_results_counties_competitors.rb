class CreateSearchResultsCountiesCompetitors < ActiveRecord::Migration
  def change
    create_table :search_results_counties_competitors do |t|
      t.string :company_name
      t.string :county_name
      t.string :display_name
      t.string :state_name
      t.string :product_class_name
      t.integer :rank_order
      t.decimal :market_share
      t.integer :reportyear
      t.datetime :reportdate

      t.timestamps
    end
<<<<<<< HEAD
    add_reference :search_results_counties_competitors, :company, index: true
    add_reference :search_results_counties_competitors, :product_class, index: true
    add_reference :search_results_counties_competitors, :state, index: true

=======
    add_reference :search_results_counties_competitors, :company
    add_reference :search_results_counties_competitors, :product_class
    add_reference :search_results_counties_competitors, :state
    add_reference :search_results_counties_competitors, :search_results_counties
	
>>>>>>> ddf4d40c9059a143eb1a5acd078506392414223a
  end
end
