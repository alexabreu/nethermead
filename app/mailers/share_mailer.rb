class ShareMailer < ActionMailer::Base
  default from: "contact@nethermead.com"

  def share(email, url, message)
    @url = url
    @message = message
    mail(to: email, subject: 'Shared Search Result from Nethermead')
  end
end
