class CreateJezmailDrafts < ActiveRecord::Migration
  def change
    create_table :jezmail_drafts do |t|
      t.string :to
      t.text :message
      t.string :subject

      t.timestamps
    end
  end
end
