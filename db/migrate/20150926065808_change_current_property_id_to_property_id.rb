class ChangeCurrentPropertyIdToPropertyId < ActiveRecord::Migration
  def change
  	rename_column :residents, :current_property_id, :property_id
  end
end
