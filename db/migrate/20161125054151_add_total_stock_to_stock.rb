class AddTotalStockToStock < ActiveRecord::Migration
  def change
  	add_column :stocks, :total_stocks, :integer
  end
end
