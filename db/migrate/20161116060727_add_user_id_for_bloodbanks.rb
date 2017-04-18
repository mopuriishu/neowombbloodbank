class AddUserIdForBloodbanks < ActiveRecord::Migration
  def change
  	add_column :blood_banks, :user_id, :integer
  end
end
