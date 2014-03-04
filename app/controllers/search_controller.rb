class SearchController < ApplicationController

def index
	@search_result = SearchResult.new
end

def find
	@result = SearchResult.where(company_name: params[:search_result][:company_name],
															state_name: params[:search_result][:state_name],
															product_class: params[:search_result][:product_class]
														  ).first
	puts @result.inspect
	
	redirect_to search_result_path(@result)
end

end
