  require 'net/pop'
  require_dependency "jezmail/application_controller"

module Jezmail
  class InboxController < ApplicationController
    def index
      Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)
      pop = Net::POP3.new('pop.gmail.com')
      pop.start('cyberreflex33@gmail.com', 'thomasjo')

      if pop.mails.empty?
        flash.now[:warning] = "Pas de nouveau mail sur le server"
      else
        pop.each_mail{|m| Traitement.receive(m.pop)}
        @message = "#{pop.mails.size} nouveau message"
        flash.now[:success] = "#{@message}"
      end
      pop.finish

      @mailrecept = Inbox.all

      countunreadmail
    end

    def destroy
      mail = Inbox.find(params[:id])
      @corbeille = Trash.new(to: mail.to, from: mail.from, body: mail.body, subject: mail.subject, source: mail.source, date: mail.date)
      if @corbeille.save
        flash[:success] = "Message supprimé, (Il est actuellement sauvegardé dans la corbeille)"
        mail.destroy
        redirect_to root_path
      else
        flash[:danger] = "Erreur lors de la suppression"
        redirect_to root_path
      end
    end

    def edit
      @mail = Inbox.find(params[:id])
    end

    def show
      @mail = Inbox.find(params[:id])
      @mail.update_attributes(unread: false)
      countunreadmail
    end

    def update
      @mail2 = Envoi.new(envoi_params)
      if @mail2.save   #(validate: false)
        envoimail(@mail2.to, @mail2.subject, @mail2.body)

        redirect_to root_path
      else
        render 'edit'
      end
    end

    def envoi_params
      params.require(:inbox).permit(:to, :body, :subject)
    end
  end
end