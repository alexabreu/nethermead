class FixCountiesJoin < ActiveRecord::Migration
  def change
    rename_column :search_results_counties, :search_results_id, :search_result_id
  end
end
