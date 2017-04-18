class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :email
      t.string :state_id
      t.string :district_id
      t.string :locality_id
      t.string :user_id
      t.string :units
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
