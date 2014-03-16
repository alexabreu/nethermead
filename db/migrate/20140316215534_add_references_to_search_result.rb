class AddReferencesToSearchResult < ActiveRecord::Migration
  def change
    add_reference :search_results, :company, index: true
    add_reference :search_results, :product_class, index: true
    add_reference :search_results, :state, index: true
  end
end
