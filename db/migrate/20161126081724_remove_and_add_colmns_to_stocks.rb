class RemoveAndAddColmnsToStocks < ActiveRecord::Migration
  def change
  	

      remove_column :orders, :person_detail_id
      remove_column :orders, :blood_bank_id
      remove_column :orders, :blood_group_id
      remove_column :orders, :units
      remove_column :orders, :user_id


end
end