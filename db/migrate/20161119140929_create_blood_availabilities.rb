class CreateBloodAvailabilities < ActiveRecord::Migration
  def change
    create_table :blood_availabilities do |t|
     

        t.integer :blood_bank_id
    	t.integer :blood_group_id
    	t.integer :total_stocks
      
       t.timestamps null: false
    end
  end
end
