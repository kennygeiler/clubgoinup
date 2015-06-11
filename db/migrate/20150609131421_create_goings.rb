class CreateGoings < ActiveRecord::Migration
  def change
    create_table :goings do |t|
      t.references :user
      t.references :venue
      t.boolean :going, default: false
      t.timestamps null: false
    end
  end
end
