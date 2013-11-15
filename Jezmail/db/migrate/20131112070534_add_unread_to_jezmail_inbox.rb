class AddUnreadToJezmailInbox < ActiveRecord::Migration
  def change
    add_column :jezmail_inboxes, :unread, :boolean
  end
end
