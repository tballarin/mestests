class AddColumnToJezmailEnvoi < ActiveRecord::Migration
  def change
    add_column :jezmail_envois, :from, :string
    add_column :jezmail_envois, :date, :string
  end
end
