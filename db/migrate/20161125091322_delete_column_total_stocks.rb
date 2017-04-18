class DeleteColumnTotalStocks < ActiveRecord::Migration
  def change
  	remove_column :stocks, :total_stocks
  end
end
