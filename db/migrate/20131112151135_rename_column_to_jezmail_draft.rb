class RenameColumnToJezmailDraft < ActiveRecord::Migration
  def change
    rename_column :jezmail_drafts, :message, :body
  end
end
