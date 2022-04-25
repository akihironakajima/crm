class CreateMatchings < ActiveRecord::Migration[6.1]
  def change
    create_table :matchings do |t|
      t.references :partner, null: false, foreign_key: true
      t.references :estimate, null: false, foreign_key: true

      t.timestamps
      
      t.index [:partner_id, :estimate_id], unique: true
    end
  end
end
