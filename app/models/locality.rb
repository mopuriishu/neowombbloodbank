class Locality < ActiveRecord::Base
	
	has_many :blood_banks
	has_many :hospitals

	belongs_to :state
	belongs_to :district


	#validates_presence_of :name, :state_id, :district_id
end
