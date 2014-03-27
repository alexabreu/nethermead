class CreateSearchResultsCompetitors < ActiveRecord::Migration
  def change
    create_table :search_results_competitors do |t|
      t.string :company_name
	 t.string :display_name
      t.integer :rank_order
      t.decimal :market_share
      t.integer :reportyear
      t.datetime :reportdate

      t.timestamps
    end
	add_reference :search_results_competitors, :company, index: true
    	add_reference :search_results_competitors, :product_class, index: true
    	add_reference :search_results_competitors, :state, index: true
  end
end
