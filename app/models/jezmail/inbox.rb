module Jezmail
  class Inbox < ActiveRecord::Base
    default_scope :order => 'jezmail_inboxes.date DESC'
  end
end