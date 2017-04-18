class ComponentType < ActiveRecord::Base

	has_many :blood_availabilities
	has_many :stocks
end
