class AddContentToEstimates < ActiveRecord::Migration[6.1]
  def change
    add_column :estimates, :content, :string
  end
end
