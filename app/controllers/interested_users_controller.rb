class InterestedUsersController < ApplicationController
  def create
    @interested_user = InterestedUser.new(email: params[:interested_user][:email])
    if @interested_user.save
      flash[:notice] = "Thank you for signing-up!"
      add_to_mailchimp
    else
      flash[:notice] = "There was a problem with the e-mail address you entered. Please try again."
    end
    redirect_to root_url
  end
  def show
  end

  private

  def add_to_mailchimp
    if Global.mailchimp.active
      gb = Gibbon::API.new(Global.mailchimp.api_key)
      gb.lists.subscribe({:id => Global.mailchimp.list_id, :email => {:email => @interested_user.email}, :double_optin => false})
    end
  end
end
