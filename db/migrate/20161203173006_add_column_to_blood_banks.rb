class AddColumnToBloodBanks < ActiveRecord::Migration
  def change
    add_column :blood_banks, :cover, :string
  end
end
