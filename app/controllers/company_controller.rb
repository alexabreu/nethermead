class CompanyController < ApplicationController
  respond_to :json

  def markets
    headers['Last-Modified'] = Time.now.httpdate
    company = Company.find(params[:id])
    t = SearchResult.arel_table
    respond_with SearchResult.where(company_id: company.id).order(:state_name).as_json(
                     :only => [ :state, :product_class, :id ], :include => [ :state, :product_class ])
  end
end
