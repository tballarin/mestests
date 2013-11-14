module Jezmail
  module ApplicationHelper
    def corbeille
      image_tag("jezmail/corbeille.png", :alt => "Supprimer le message", :height => "25px")
    end

    def repondre
      image_tag("jezmail/repondre.png", :alt => "Repondre", :height => "25px")
    end

    def details
      image_tag("jezmail/oeuil.png", :alt => "Details", :height => "25px")
    end

    def logo
      image_tag("jezmail/logo.jpg", :alt => "DesArts", :class => "round")
    end
  end
end
