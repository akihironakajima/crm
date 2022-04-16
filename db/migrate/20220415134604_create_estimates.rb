class CreateEstimates < ActiveRecord::Migration[6.1]
  def change
    create_table :estimates do |t|
      t.string :name
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
