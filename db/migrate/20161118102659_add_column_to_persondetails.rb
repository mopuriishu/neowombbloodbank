class AddColumnToPersondetails < ActiveRecord::Migration
  def change
  	add_column :person_details, :user_id, :integer
  end
end
