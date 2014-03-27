class SearchResult < ActiveRecord::Base
  belongs_to :company
  belongs_to :product_class
  belongs_to :state

  def counties
    ['County A', 'County B', 'County C', 'County D', 'County E']
  end

  def state_competition
    [['Company A', 55], ['County B', 10], ['County C', 10],['County D', 10], ['County E', 10], ['Other', 05]]
  end

  def percentage_market_share
    if share_company_in_state
      return share_company_in_state * 100
    end
    return 20
  end
end
