require_dependency "jezmail/application_controller"

module Jezmail
  class TrashController < ApplicationController
      def index
        @mailtrash = Trash.all
      end

      def destroy
         Trash.delete_all
         flash[:success] = "La corbeille à bien été vidée"
        redirect_to root_path
      end

      def show
        @mail = Trash.find(params[:id])
      end

      def edit
        mail = Trash.find(params[:id])
        @recupmail = Inbox.new(to: mail.to, from: mail.from, body: mail.body, subject: mail.subject, source: mail.source, date: mail.date, unread: false)
        if @recupmail.save
          flash[:success] = "Le message à bien été récupéré"
          mail.destroy
          redirect_to root_path
        else
          flash[:danger] = "Erreur lors de la récupération"
          redirect_to trash_path
        end
      end
    end
end