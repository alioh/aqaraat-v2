class CreateResidents < ActiveRecord::Migration
  def change
    create_table :residents do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :summary
      t.references :current_property
      t.references :user_id
      t.references :bill_id

      t.timestamps null: false
    end
  end
end
