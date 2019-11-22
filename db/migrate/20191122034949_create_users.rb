class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name
    	t.datetime :birthday
    	t.string :origin
    	t.string :intro
    	t.string :job
    	t.integer :income
    	t.string :height
    	t.string :bio
    	t.string :token
    	t.integer :gender

      t.timestamps
    end
  end
end
