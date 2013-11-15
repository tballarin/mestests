module Jezmail
  class Envoi < ActiveRecord::Base
    #attr_accessible :to, :body, :subject

    default_scope :order => 'jezmail_envois.created_at DESC'

    validates(:body, :presence => true)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :to, :presence => true,
              :format   => { :with => email_regex }

  end
end