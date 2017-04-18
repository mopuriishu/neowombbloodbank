class Hospital < ActiveRecord::Base
	#has_many :stocks
	#has_many :blood_availabilities
	belongs_to :locality
	belongs_to :district
	belongs_to :state
    belongs_to :user
	
end
