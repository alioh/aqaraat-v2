class AddLatLngToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :lat, :decimal
    add_column :properties, :lng, :decimal
  end
end
