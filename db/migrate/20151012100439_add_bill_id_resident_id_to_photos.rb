class AddBillIdResidentIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :resident_id, :integer, references: :residents
    add_column :photos, :bill_id, :integer, references: :bills
  end
end
