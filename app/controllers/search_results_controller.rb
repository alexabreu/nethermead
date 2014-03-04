class SearchResultsController < ApplicationController
  def show
  	@search_result = SearchResult.find(params[:id])
  end
end
