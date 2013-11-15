module Jezmail
  class Traitement < ActionMailer::Base
      def receive(email)

        from = email.from.to_s
        from2 = from.gsub('["',"")
        from3 = from2.gsub('"]',"")

        to = email.to.to_s
        to2 = to.gsub('["',"")
        to2b = to2.gsub(/'/,"")
        to3 = to2b.gsub('"]',"")


        reception = Inbox.new(from: from3, to: to3, body: email.body.decoded, subject: email.subject, date: email.date, source: email.to_s, unread: true)
        reception.save
      end
    end
end
