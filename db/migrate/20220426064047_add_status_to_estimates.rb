class AddStatusToEstimates < ActiveRecord::Migration[6.1]
  def change
    add_column :estimates, :status, :string
  end
end
