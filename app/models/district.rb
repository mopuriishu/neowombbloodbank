class District < ActiveRecord::Base
	
	has_many :localities
	has_many :blood_banks
	has_many :hospitals

	belongs_to :state

	#validates_presence_of :name, :state_id
end
