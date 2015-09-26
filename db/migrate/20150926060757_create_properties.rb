class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address
      t.string :city
      t.string :country
      t.string :property_type
      t.integer :monthly_rent
      t.text :description
      t.boolean :vacancy
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
