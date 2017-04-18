class AddColumnToStocks < ActiveRecord::Migration
  def change

  	add_column   :stocks, :component_required, :string

  end
end
