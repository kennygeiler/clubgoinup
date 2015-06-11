class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :men
      t.integer :women
      t.integer :min
      t.integer :max
      t.text :venues
      t.date :date
      t.text :comments
      t.timestamps null: false
    end
  end
end
