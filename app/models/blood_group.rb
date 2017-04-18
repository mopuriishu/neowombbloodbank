class BloodGroup < ActiveRecord::Base

	has_many :stocks
	has_many :bloodavailabilities
	has_many :person_details
	has_many :users


	validates_presence_of :name

end
