class CreatePromotors < ActiveRecord::Migration
  def change
    create_table :promotors do |t|
      t.references :user
      t.string :company
      t.text :venues
      t.text :about
      t.string :instagram
      t.timestamps null: false
    end
  end
end
