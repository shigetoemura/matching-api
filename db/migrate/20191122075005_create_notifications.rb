class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.bigint "from_user_id"
      t.references "to_user", foreign_key: { to_table: :users }
      t.references :notificable, polymorphic: true

      t.timestamps
    end
    add_index :notifications, [:notificable_id, :notificable_type], unique: true
  end
end
