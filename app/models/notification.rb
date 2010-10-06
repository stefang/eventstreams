class Notification < ActionMailer::Base
  
  default_url_options[:host] = HOST

  def invitation(invite)
    from       'notifications@eventstreamsapp.com'
    recipients invite.email
    subject    "[Eventstreams] Invitation to join Eventstreams"
    body       :invite => invite
  end
  
  def contact(data, event)
    from        'notifications@eventstreamsapp.com'
    recipients  event.user.email
    subject     "[Eventstreams] Message from the '#{event.title}' contact form"
    body        "A message has been sent from the '#{event.title}' contact form. \r\n\r\n **** \r\n\r\n From : #{data[:name]} / #{data[:email]} \r\n\r\n **** \r\n\r\n #{data[:message]}"
  end
  
  def support_email(data)
    from        'notifications@eventstreamsapp.com'
    recipients  'me@stefangoodchild.com'
    subject     "[Eventstreams] Support Request"
    body        "A support request has been sent. \r\n\r\n **** \r\n\r\n From : #{data[:name]} / #{data[:email]} \r\n\r\n **** \r\n\r\n #{data[:message]}"
  end

end
