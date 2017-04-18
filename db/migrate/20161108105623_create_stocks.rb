class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|

    	
    	t.integer :blood_bank_id
    	t.integer :blood_group_id
    	t.string :units

      t.timestamps null: false
    end
  end
end
