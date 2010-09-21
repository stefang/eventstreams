class Notification < ActionMailer::Base
  
  default_url_options[:host] = HOST

  def invitation(invite)
    from       'notifications@eventstreamsapp.com'
    recipients invite.email
    subject    "[Eventstreams] Invitation to join Eventstreams"
    body       :invite => invite
  end

end
