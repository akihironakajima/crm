class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin

      t.timestamps
    end
  end
end
