class CreateJezmailEnvois < ActiveRecord::Migration
  def change
    create_table :jezmail_envois do |t|
      t.text :to
      t.text :body
      t.string :subject

      t.timestamps
    end
  end
end
