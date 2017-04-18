class CreateBloodBanks < ActiveRecord::Migration
  def change
    create_table :blood_banks do |t|

    	t.string :name
    	t.string :bloodcollect_type
    	t.string :address
        t.integer :locality_id
    	t.integer :district_id
        t.integer :state_id
    	t.string :email
    	t.string :mobile
    	t.string :phone_no
    	t.string :manager


      t.timestamps null: false
    end
  end
end
