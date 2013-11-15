class CreateJezmailMontests < ActiveRecord::Migration
  def change
    create_table :jezmail_montests do |t|

      t.timestamps
    end
  end
end
