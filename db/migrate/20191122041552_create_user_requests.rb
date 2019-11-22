class CreateUserRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requests do |t|
      t.bigint :from_user_id
      t.references :to_user_id, foreign_key: { to_table: :users }
      t.integer :status, :default =>  0

      t.timestamps
    end
  end
end
