class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :favorable, polymorphic: true

      t.timestamps
    end
    add_index :favorites, [:favorable_id, :favorable_type, :user_id], unique: true
  end
end
