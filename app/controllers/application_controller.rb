class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  http_basic_authenticate_with name: "nethermead", password: "12345!@#$%"
  
  protect_from_forgery with: :exception
  before_action :set_interested_user
  
  has_mobile_fu

  def set_interested_user
    @interested_user = InterestedUser.new
  end
end
