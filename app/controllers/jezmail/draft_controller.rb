require_dependency "jezmail/application_controller"

module Jezmail
  class DraftController < ApplicationController

    def index
      @draft = Draft.all
      countbrouillon

    end

    def destroy
      Draft.find(params[:id]).destroy
      flash[:success] = "Brouillon supprimé."
      redirect_to draft_index_path
    end

    def edit
      @draft = Draft.find(params[:id])
    end

    def update
      @draft = Envoi.new(envoi_params)
        if @draft.save
          if envoimail(@draft.to, @draft.subject, @draft.body)
            Draft.delete(params[:id])
            countbrouillon
            flash[:success] = "Message envoyé avec succès"
            redirect_to messagessent_path
          else
            flash.now[:danger] = "Erreur lors de l'envoi du message"
            render 'edit'
          end
        else
          render 'edit'
        end
    end

    private
    def envoi_params
      params.require(:draft).permit(:to, :body, :subject)
    end
  end
end