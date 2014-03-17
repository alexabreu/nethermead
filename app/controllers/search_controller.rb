class SearchController < ApplicationController
  respond_to :html, :json

  def index
    @search_result = SearchResult.new
  end

  def find
    t = SearchResult.arel_table
    @result = SearchResult.where(
                t[:company_name].matches(params[:search_result][:company_name])
                .and(t[:state_name].eq(params[:search_result][:state_name]))
                .and(t[:product_class].eq(params[:search_result][:product_class]))
                ).first
    if @result
      redirect_to search_result_path @result
    else
      flash[:notice] = "Whoops. No matching combination."
      redirect_to search_path
    end
  end

  def companies
    t = Company.arel_table
    respond_with Company.where(
        t[:name_proper].matches("%" + params[:company_name] + "%")
    ).as_json
  end

end
