class RenameBillsTable < ActiveRecord::Migration
  def change
    rename_table :Bills, :bills
  end
end
