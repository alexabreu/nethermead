class SearchResult < ActiveRecord::Base
  belongs_to :company
  belongs_to :product_class
  belongs_to :state

  def percentage_market_share
    if share_company_in_state
      return share_company_in_state * 100
    end
    return 0
  end
end
