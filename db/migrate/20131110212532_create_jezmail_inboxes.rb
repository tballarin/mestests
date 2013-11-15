class CreateJezmailInboxes < ActiveRecord::Migration
  def change
    create_table :jezmail_inboxes do |t|
      t.text :from
      t.text :to
      t.text :body
      t.string :subject
      t.datetime :date
      t.text :source

      t.timestamps
    end
  end
end
