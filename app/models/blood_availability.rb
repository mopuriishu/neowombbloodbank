class BloodAvailability < ActiveRecord::Base

	belongs_to :component_type
	belongs_to :blood_group
	belongs_to :blood_bank
   
  

end
