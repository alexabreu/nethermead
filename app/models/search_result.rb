class SearchResult < ActiveRecord::Base
  belongs_to :company
  belongs_to :product_class
  belongs_to :state
end
