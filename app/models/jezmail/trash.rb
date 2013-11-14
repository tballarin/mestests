module Jezmail
  class Trash < ActiveRecord::Base
    default_scope :order => 'jezmail_trashes.created_at DESC'
  end
end