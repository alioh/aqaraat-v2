class ChangeBillsUserIdIdToUserId < ActiveRecord::Migration
  def change
  	rename_column :Bills, :property_id_id, :property_id
  	rename_column :Bills, :user_id_id, :user_id
  	rename_column :Bills, :resident_id_id, :resident_id
  end
end
