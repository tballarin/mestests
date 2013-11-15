require_dependency "jezmail/application_controller"

module Jezmail
  class EnvoisController < ApplicationController
    def new
      @envoi = Envoi.new
      $currentbrouillon = 0
    end

    def create
      @envoi = Envoi.new(envoi_params)
      if params[:commit] == 'Enregistrer en brouillon'
        savedraft
        render 'new'
      else
        if @envoi.save
            if envoimail(@envoi.to, @envoi.subject, @envoi.body)
              if $currentbrouillon != 0
                Draft.delete($currentbrouillon)
                countbrouillon
              end
              redirect_to messagessent_path
            else
              render 'new'
            end
        else
          render 'new'
        end
      end
    end

    def index
      @mailenvoi = Envoi.all
    end

    def show
      @mail = Envoi.find(params[:id])
    end

    def destroy
      Envoi.find(params[:id]).destroy
      flash[:success] = "Message supprimé."
      redirect_to messagessent_path
    end

    def savedraft
      if $currentbrouillon == 0
        @draft = Draft.new(envoi_params)
          if @draft.save(validate: false)
          $currentbrouillon = @draft
          flash.now[:success] = "Brouillon enregistré"
          countbrouillon
          end
      else
        @brouillon = Draft.find($currentbrouillon)
        @brouillon.update_attribute(:to,"#{@envoi.to}")
        @brouillon.update_attribute(:body, "#{@envoi.body}")
        @brouillon.update_attribute(:subject, "#{@envoi.subject}")
        flash[:success] = "Brouillon enregistré"
      end
    end


    private
    def envoi_params
      params.require(:envoi).permit(:to, :body, :subject)
    end
  end
end