class AddColumnToBloodAvailabilities < ActiveRecord::Migration
  def change
    add_column :blood_availabilities, :component_type_id, :integer
  end
end
