class CreatePromotors < ActiveRecord::Migration
  def change
    create_table :promotors do |t|
      t.references :user
      t.string :company
      t.string :location
      t.text :venues
      t.timestamps null: false
    end
  end
end
