class AddCommunicationPreferenceToSearchResults < ActiveRecord::Migration
  def change
	add_column :search_results, :communication_preference, :string
  end
end
