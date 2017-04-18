class CreateBloodgroupComponenttypes < ActiveRecord::Migration
  def change
    create_table :bloodgroup_componenttypes do |t|
   
      t.integer :blood_group_id
      t.integer :component_type_id
      
      t.timestamps null: false
    end
  end
end
