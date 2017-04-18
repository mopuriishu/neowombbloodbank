class AddColumnUserId < ActiveRecord::Migration
  def change
  	add_column :blood_groups, :user_id, :integer
  end
end
