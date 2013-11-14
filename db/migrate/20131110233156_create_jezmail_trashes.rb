class CreateJezmailTrashes < ActiveRecord::Migration
  def change
    create_table :jezmail_trashes do |t|
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
