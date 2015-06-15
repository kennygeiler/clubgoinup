class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :men
      t.integer :women
      t.integer :min
      t.integer :max
      t.boolean :bottles, default: false
      t.text :venues
      t.date :date
      t.string :location
      t.text :comments
      t.references :user
      t.timestamps null: false
    end
  end
end
