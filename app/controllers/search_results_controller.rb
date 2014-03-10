class SearchResultsController < ApplicationController
  def show
  	@r = SearchResult.find(params[:id])
  end
end
