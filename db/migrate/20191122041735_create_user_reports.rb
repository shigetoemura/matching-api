class CreateUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reports do |t|
      t.references :user, foreign_key: true
      t.bigint :report_user_id
      t.string :reason

      t.timestamps
    end
  end
end
