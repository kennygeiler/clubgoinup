class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :liker
      t.references :likee
      t.boolean :like, default: false
      t.timestamps null: false
    end
  end
end
