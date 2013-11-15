
module Jezmail
  class Draft < ActiveRecord::Base
  default_scope :order => 'jezmail_drafts.created_at DESC'

  validates(:body, :presence => true)
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :to, :presence => true,
            :format   => { :with => email_regex }

  end
end