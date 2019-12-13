class AddToUserIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :to_user_id, :bigint
  end
end
