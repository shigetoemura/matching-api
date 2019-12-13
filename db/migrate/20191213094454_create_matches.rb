class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :match_request, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
