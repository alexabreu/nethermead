class SearchResult < ActiveRecord::Base
  belongs_to :company
  belongs_to :product_class
  belongs_to :state
  has_many :search_results_county

  def state_competition
    SearchResultsCompetitor.where(:product_class_id => product_class_id, :state_id => state_id).order(rank_order: :asc).pluck(:display_name, :market_share)
  end

  def percentage_market_share
    if share_company_in_state
      return (share_company_in_state * 100).to_int
    end
    return 20
  end
end
