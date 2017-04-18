class PersonDetail < ActiveRecord::Base
	belongs_to :state
	belongs_to :district
	belongs_to :locality
	belongs_to :blood_group
	belongs_to :user
	

end