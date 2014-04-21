class SearchController < ApplicationController
  respond_to :html, :json
  layout "search"

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

  def show
    company = Company.where(Company.arel_table[:slug].matches(params[:slug])).first
    state = State.where(State.arel_table[:state_name].matches(params[:state].upcase)).first
    product_class = ProductClass.where(ProductClass.arel_table[:abbr].matches(params[:class].upcase)).first
    @result = SearchResult.where(
        company_id: company.id,
        state_id: state.id,
        product_class_id: product_class.id
    ).first
  end

  def targeting
    show
  end

  def segmentation
    show
  end

  def export
    show
    response.headers['Content-Type'] = 'text/csv'
    csv_string = CSV.generate do |csv|
      csv << @result.attribute_names
      csv << @result.attributes.values
    end
    send_data csv_string
  end

  def share
    show
    if params[:email] && params[:email].match(/@/) && params[:message]
      url = url_for :controller => 'search', :action => 'show', :slug => @result.company.slug, :state => @result.state.state_name, :class => @result.product_class.abbr, :only_path => false
      ShareMailer.share(params[:email], url, params[:message]).deliver
    end
    flash[:notice] = "Thank you for sharing this result!"
    redirect_to url_for :controller => 'search', :action => 'show', :slug => @result.company.slug, :state => @result.state.state_name, :class => @result.product_class.abbr
  end

  def companies
    t = Company.arel_table
    respond_with Company.where(
        t[:name_proper].matches("%" + params[:company_name] + "%")
    ).as_json
  end

end
