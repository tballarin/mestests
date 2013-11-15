require 'net/smtp'


module Jezmail
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def countunreadmail
    @mailrecept = Inbox.all
    $nbnew = 0
    @mailrecept.each do |email|
      if email.unread == true
        $nbnew += 1
      end
    end
    countbrouillon
  end

  def countbrouillon
    $nbdraft = Draft.count
  end

  def envoimail(to2, subject2, body2)
    to = to2
    subject = subject2
    message = body2
    from = "cyberreflex33@gmail.com"
    message_body = <<END_OF_EMAIL
From: Thomas Ballarin <'#{from}'>
To: Other Email <'#{to}'>
Subject: #{subject}

    #{message}
END_OF_EMAIL
    server = 'smtp.gmail.com'
    #mail_from_domain = 'gmail.com'
    port = 587
    username = 'cyberreflex33@gmail.com'
    password = 'thomasjo'

    smtp = Net::SMTP.new(server, port)
    smtp.enable_starttls_auto
    smtp.start(server,username,password, :plain)
    if smtp.send_message(message_body,from, to)
      flash[:success] = "Message envoyé avec succès"
    else
      flash.now[:danger] = "Erreur lors de l'envoi du message"
    end


  end
  end
end

