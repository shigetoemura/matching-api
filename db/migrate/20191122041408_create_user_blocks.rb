class CreateUserBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_blocks do |t|
    	t.references :user, foreign_key: true
    	t.bigint :blocking_user_id

      t.timestamps
    end
  end
end
