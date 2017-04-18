class CreatePersonDetails < ActiveRecord::Migration
  def change
    create_table :person_details do |t| 

        t.string :name
    	t.string :email
    	t.string :password
    	t.string :mobile_no
    	t.string :user_type
    	t.integer :state_id
    	t.integer :district_id
    	t.integer :locality_id
    	t.string :blood_group_id

      t.timestamps null: false
    end
  end
end
