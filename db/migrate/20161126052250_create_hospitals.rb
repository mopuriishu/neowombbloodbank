class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|

        t.string :name
        t.string :address
        t.integer :locality_id
    	t.integer :district_id
        t.integer :state_id
    	t.string :email
    	t.string :mobile_number
    	t.string :landline_number
    	t.string :manager_name


      t.timestamps null: false
    end
  end
end
