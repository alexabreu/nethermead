class CreateSearchResultsSegmentsCommunications < ActiveRecord::Migration
  def change
    create_table :search_results_segments_communications do |t|
      t.string :segment_name
      t.string :segment_type
      t.string :communication_preference
      t.string :communication_type
      t.string :marketing_context
	 t.integer :preference_rank

      t.timestamps
    end
	add_reference :search_results_segments_communications, :segment, index: true
	add_reference :search_results_segments_communications, :search_results_segment, index: true 
  end
end
