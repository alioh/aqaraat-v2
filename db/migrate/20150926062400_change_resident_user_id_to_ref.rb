class ChangeResidentUserIdToRef < ActiveRecord::Migration
  def change
  	rename_column :Residents, :user_id_id, :user_id
  	rename_column :Residents, :bill_id_id, :bill_id
  end
end
