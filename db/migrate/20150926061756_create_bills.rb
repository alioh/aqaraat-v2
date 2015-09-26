class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.date :due_date
      t.integer :amount
      t.string :bill_type
      t.boolean :bill_status
      t.text :description
      t.references :property_id, index: true, foreign_key: true
      t.references :user_id, index: true, foreign_key: true
      t.references :resident_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
