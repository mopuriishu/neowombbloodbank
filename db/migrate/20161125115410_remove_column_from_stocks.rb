class RemoveColumnFromStocks < ActiveRecord::Migration
  def change

  	remove_column :stocks, :component_required
  	add_column :stocks, :component_type_id, :integer
  end
end
