class RemoveColumnsFromPersondetails < ActiveRecord::Migration
  def change
  	remove_column :person_details, :user_type
  	remove_column :blood_banks, :bloodcollect_type
  	drop_table :bloodgroup_componenttypes
  	rename_column :blood_banks, :phone_no, :landline_number
  end
end
