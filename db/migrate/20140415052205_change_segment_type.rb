class ChangeSegmentType < ActiveRecord::Migration
  def change
  	rename_column :segments, :type, :segment_type
  end
end
