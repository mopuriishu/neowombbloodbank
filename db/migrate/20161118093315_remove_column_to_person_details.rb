class RemoveColumnToPersonDetails < ActiveRecord::Migration
  def change
  	remove_column :person_details, :password
  	   
  end
end
