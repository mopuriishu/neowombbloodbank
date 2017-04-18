class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :person_detail_id
    	t.integer :blood_bank_id
    	t.integer :blood_group_id
    	t.string :units
    	t.integer :user_id



      t.timestamps null: false
    end
  end
end
